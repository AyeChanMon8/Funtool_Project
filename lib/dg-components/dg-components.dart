import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import '../routes/app_pages.dart';
import '../theme/app_theme.dart';
import 'constants/globals.dart';
import 'constants/providers.dart';
import 'constants/themes.dart';
import 'system/dg-providers.dart';
import 'system/dg-providers/language_provider.dart';
import 'widget_tools/app_restart.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      defaultThemeId: 'light_default',
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: Themes.get(),
      child: ThemeConsumer(child: Builder(builder: (themeContext) {
        isDarkTheme = ThemeProvider.themeOf(themeContext).id.contains('dark');

        return Consumer<LanguageProvider>(builder: (context, state, child) {
          return GetMaterialApp(
            enableLog: true,
            defaultTransition: Transition.fade,
            locale: Locale('en', 'US'), // Set the default locale
            fallbackLocale: Locale('en', 'US'), // Fallback locale
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            theme: appThemeData,
            getPages: AppPages.pages,
          );
        });
      })),
    );
  }
}

class DGComponents extends StatelessWidget {
  const DGComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Status bar color
    ));

    return AppRestart(
        child: MultiProvider(
            providers: Providers.get(),
            child: MultiProvider(
                providers: DGProviders.get(), child: const MyApp())));
  }
}

class DGComponentsInstall {
  static get({required bool setupLogging}) async {
    await GetStorage.init();
    // await DartVLC.initialize(useFlutterNativeView: true);

    if (setupLogging) {
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen(
          (rec) => {print("${rec.level.name}: ${rec.time} : ${rec.message}")});
    }
    if (!kIsWeb) {
      if (!Platform.isAndroid) {}
    }
  }
}
