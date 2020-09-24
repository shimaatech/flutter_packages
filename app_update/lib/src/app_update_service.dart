import 'package:app_update/src/app_info_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:pedantic/pedantic.dart';
import 'package:repository/repository.dart';

class AppUpdateService {
  static const String lastUpdateTrialConfigKey = 'app.update.lastTrial';
  static const updateHighestPriority = 5;
  static const updateLowestPriority = 0;

  AppUpdateService(
    this.appInfoService,
    this.localStorage,
    this.appBuildNumber, {
    this.daysIntervalByPriority = 1,
  });

  final LocalStorage localStorage;
  final AppInfoService appInfoService;
  final daysIntervalByPriority;
  final double appBuildNumber;

  Future<bool> checkForUpdate(BuildContext context) async {
    AppInfo appInfo = await appInfoService.getAppInfo(forceFetch: false);
    if (needsUpdate(appInfo)) {
      if (needsImmediateUpdate(appInfo.priority)) {
        await showImmediateUpdateDialog(context);
        return true;
      } else if (shouldSuggestUpdate(appInfo.priority)) {
        unawaited(updateLastUpdateTrial());
        return showFlexibleUpdateDialog(context);
      }
    }
    return false;
  }

  bool needsUpdate(AppInfo appInfo) {
    return appInfo.latestVersion > appBuildNumber;
  }

  bool needsImmediateUpdate(int priority) {
    return priority == updateHighestPriority;
  }

  Future<bool> showFlexibleUpdateDialog(BuildContext context) async {
    bool updateClicked = false;

    await showUpdateDialog(
      context: context,
      content:
          'A new update is available. Pleas update in order to get the latest features of the app',
      showLaterButton: true,
      onUpdatePressed: () {
        updateClicked = true;
      },
    );

    return updateClicked;
  }

  void launchUpdate() {
    // TODO pass ios package name also in the future
    LaunchReview.launch(
        androidAppId: appInfoService.packageName, writeReview: false);
  }

  Future<void> showImmediateUpdateDialog(BuildContext context) {
    return showUpdateDialog(
        context: context,
        content: 'Please update the app in order to continue',
        showLaterButton: false);
  }

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

  Future<void> updateLastUpdateTrial() {
    return localStorage.save(lastUpdateTrialConfigKey, DateTime.now());
  }

  Future<void> showUpdateDialog({
    @required BuildContext context,
    @required String content,
    bool showLaterButton = true,
    VoidCallback onUpdatePressed,
  }) {
    // TODO use localizations
    return AwesomeDialog(
      dialogType: DialogType.NO_HEADER,
      context: context,
      title: 'App Update',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(content),
      ),
      btnOk: RaisedButton(
        child: Text('Update'),
        onPressed: () {
          if (onUpdatePressed != null) {
            onUpdatePressed.call();
          }
          launchUpdate();
        },
      ),
      btnCancel: showLaterButton
          ? FlatButton(
              child: Text('Later'),
              onPressed: () => Navigator.of(context).pop(),
            )
          : Container(),
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
    ).show();
  }
}
