// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// TODO(cyanglaz): Remove once https://github.com/flutter/plugins/pull/3158 is landed.
// @dart = 2.9

import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_info/device_info.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  IosDeviceInfo iosInfo;
  AndroidDeviceInfo androidInfo;

  setUpAll(() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS) {
      iosInfo = await deviceInfoPlugin.iosInfo;
    } else if (Platform.isAndroid) {
      androidInfo = await deviceInfoPlugin.androidInfo;
    }
  });

  testWidgets('Can get non-null device model', (WidgetTester tester) async {
    if (Platform.isIOS) {
      expect(iosInfo.model, isNotNull);
    } else if (Platform.isAndroid) {
      expect(androidInfo.model, isNotNull);
    }
  });
}
