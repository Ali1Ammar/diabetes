import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'main/app.dart';
import 'main/screenshot.dart';

void main() {
  runApp(DevicePreview(
    builder: (_) => const MyApp(
      appBulder: DevicePreview.appBuilder,
    ),
    plugins: [screenshotWithModePlugin],
  ));
}
