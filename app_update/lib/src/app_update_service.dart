import 'package:app_update/app_update.dart';
import 'package:app_update/src/app_info_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:pedantic/pedantic.dart';
import 'package:repository/repository.dart';

import 'app_info.dart';

class AppUpdateService {
  static const String lastUpdateTrialConfigKey =
      'app_update_service.update.lastTrial';
  static const updateHighestPriority = 5;
  static const updateLowestPriority = 0;

  AppUpdateService(
    this.appInfoService,
    this.localStorage,
    this.appBuildNumber, {
    this.daysIntervalByPriority = 2,
  });

  final LocalStorage localStorage;
  final AppInfoService appInfoService;
  final daysIntervalByPriority;
  final double appBuildNumber;

  Future<bool> checkForUpdate(BuildContext context) async {
    AppInfo appInfo = await appInfoService.getAppInfo(forceFetch: false);
    if (needsUpdate(appInfo) && updateIsActive(appInfo)) {
      if (needsImmediateUpdate(appInfo.updateInfo.priority)) {
        await showImmediateUpdateDialog(context);
        return true;
      } else if (shouldSuggestUpdate(appInfo.updateInfo.priority)) {
        unawaited(updateLastUpdateTrial());
        return showFlexibleUpdateDialog(context);
      }
    }
    return false;
  }

  Future<bool> canShowUpdateDialog() async {
    AppInfo appInfo = await appInfoService.getAppInfo(forceFetch: false);
    return needsUpdate(appInfo) &&
        updateIsActive(appInfo) &&
        (needsImmediateUpdate(appInfo.updateInfo.priority) ||
            shouldSuggestUpdate(appInfo.updateInfo.priority));
  }

  /// Can be used to show flexible update dialog with a custom message whenever
  /// you want (of course only if a newer version is available)
  Future<void> showUpdateDialogIfNeedsUpdate(
      BuildContext context, String message) async {
    AppInfo appInfo = await appInfoService.getAppInfo(forceFetch: false);
    if (needsUpdate(appInfo)) {
      return showUpdateDialog(
        context: context,
        content: message,
        showLaterButton: true,
      );
    }
  }

  @protected
  bool needsUpdate(AppInfo appInfo) {
    return appInfo.latestVersion > appBuildNumber;
  }

  @protected
  bool updateIsActive(AppInfo appInfo) {
    return appInfo.updateInfo != null && appInfo.updateInfo.active;
  }

  @protected
  bool needsImmediateUpdate(int priority) {
    return priority == updateHighestPriority;
  }

  @protected
  Future<bool> showFlexibleUpdateDialog(BuildContext context) async {
    bool updateClicked = false;

    await showUpdateDialog(
      context: context,
      content: UpdateDialogLocalizations.of(context).flexibleUpdateMessage,
      showLaterButton: true,
      onUpdatePressed: () {
        updateClicked = true;
      },
    );

    return updateClicked;
  }

  @protected
  void launchUpdate() {
    LaunchReview.launch(
        iOSAppId: appInfoService.packageName,
        androidAppId: appInfoService.packageName,
        writeReview: false);
  }

  @protected
  Future<void> showImmediateUpdateDialog(BuildContext context) {
    return showUpdateDialog(
        context: context,
        content: UpdateDialogLocalizations.of(context).immediateUpdateMessage,
        showLaterButton: false);
  }

  @protected
  bool shouldSuggestUpdate(int priority) {
    DateTime lastUpdateTrial = localStorage.get(lastUpdateTrialConfigKey);
    if (lastUpdateTrial == null) {
      return true;
    }
    int trialDaysInterval =
        (updateHighestPriority - priority) * daysIntervalByPriority;
    return DateTime.now().difference(lastUpdateTrial).inDays >=
        trialDaysInterval;
  }

  @protected
  Future<void> updateLastUpdateTrial() {
    return localStorage.save(lastUpdateTrialConfigKey, DateTime.now());
  }

  @protected
  Future<void> showUpdateDialog({
    @required BuildContext context,
    @required String content,
    bool showLaterButton = true,
    VoidCallback onUpdatePressed,
  }) {
    final localizations = UpdateDialogLocalizations.of(context);
    return AwesomeDialog(
      dialogType: DialogType.NO_HEADER,
      context: context,
      title: localizations.title,
      desc: content,
      btnOk: RaisedButton(
        child: Text(localizations.update),
        onPressed: () {
          if (onUpdatePressed != null) {
            onUpdatePressed.call();
          }
          launchUpdate();
        },
      ),
      btnCancel: showLaterButton
          ? FlatButton(
              child: Text(localizations.later),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
    ).show();
  }
}
