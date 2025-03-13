import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/globals.dart';

class DGTools {
  static fullScreen({required bool isEnabled}) {
    if (!kIsWeb) {
      if (isEnabled) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      } else if (Platform.isAndroid) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
      }
    }
  }

  static String getFileSize(int file) {
    final kb = file / 1024;
    final mb = kb / 1024;
    final fileSize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    return fileSize;
  }

  static navBarColor({required Color color}) {
    if (!kIsWeb) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: color,
        systemNavigationBarIconBrightness:
            isDarkTheme ? Brightness.light : Brightness.dark,
      ));
    }
  }

  static statusBarColor({required Color color}) {
    if (!kIsWeb) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarIconBrightness:
              isDarkTheme ? Brightness.light : Brightness.dark,
          statusBarBrightness: isDarkTheme ? Brightness.light : Brightness.dark,
          statusBarColor: color));
    }
  }

  static double keyboardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }
}
