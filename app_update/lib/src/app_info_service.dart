import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AppInfo {
  AppInfo(this.latestVersion, this.priority);

  final double latestVersion;
  final int priority;
}

class AppInfoService {
  static const String collectionName = 'app_info';

  AppInfoService(this.firestore, this.packageName);

  final Firestore firestore;
  final String packageName;

  @protected
  AppInfo appInfo;

  Future<AppInfo> getAppInfo({forceFetch = false}) async {
    if (appInfo == null || forceFetch) {
      appInfo = await fetchAppInfo();
    }
    return appInfo;
  }

  @protected
  String getAppInfoDocument(String packageName) {
    return '$packageName.${Platform.operatingSystem}';
  }

  @protected
  Future<AppInfo> fetchAppInfo() async {
    Map<String, dynamic> data = (await Firestore.instance
            .collection(collectionName)
            .document(getAppInfoDocument(packageName))
            .get())
        .data;
    return AppInfo(data['latest_version'], data['priority']);
  }
}
