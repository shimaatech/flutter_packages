import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'app_info.dart';

class AppInfoService {
  static const String collectionName = 'app_info';

  AppInfoService(this.firestore, this.packageName);

  final FirebaseFirestore firestore;
  final String packageName;

  @protected
  AppInfo? appInfo;

  Future<AppInfo?> getAppInfo({forceFetch = false}) async {
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
  Future<AppInfo?> fetchAppInfo() async {
    final data = (await firestore
            .collection(collectionName)
            .doc(getAppInfoDocument(packageName))
            .get())
        .data();
    if (data != null) {
      return AppInfo.serializer.deserialize(data);
    }
    return null;
  }
}
