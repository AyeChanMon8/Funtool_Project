import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';

import 'data.dart';

class Themes {
  static List<AppTheme> get() => [
        AppTheme.light(id: 'light'),
        AppTheme.dark(id: 'dark'),
        AppTheme(
            id: "light_default", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: lightThemeData(primaryColor: kPrimaryColor)),
        AppTheme(
            id: "light_red", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: lightThemeData(primaryColor: Colors.red)),
        AppTheme(
            id: "light_green", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: lightThemeData(primaryColor: Colors.green)),
        AppTheme(
            id: "light_blue", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: lightThemeData(primaryColor: Colors.blue)),
        AppTheme(
            id: "light_yellow", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: lightThemeData(primaryColor: Colors.yellow)),
        AppTheme(
            id: "light_cyan", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: lightThemeData(primaryColor: Colors.cyan)),
        AppTheme(
            id: "light_orange", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: lightThemeData(primaryColor: Colors.orange)),
        AppTheme(
            id: "light_pink", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: lightThemeData(primaryColor: Colors.pink)),
        AppTheme(
            id: "light_purple", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: lightThemeData(primaryColor: Colors.purple)),
        ////////////////////----Dark
        AppTheme(
            id: "dark_default", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: darkThemeData()),
        AppTheme(
            id: "dark_red", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: darkThemeData(primaryColor: Colors.red)),
        AppTheme(
            id: "dark_green", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: darkThemeData(primaryColor: Colors.green)),
        AppTheme(
            id: "dark_blue", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: darkThemeData(primaryColor: Colors.blue)),
        AppTheme(
            id: "dark_yellow", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: darkThemeData(primaryColor: Colors.yellow)),
        AppTheme(
            id: "dark_cyan", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: darkThemeData(primaryColor: Colors.cyan)),
        AppTheme(
            id: "dark_orange", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: darkThemeData(primaryColor: Colors.orange)),
        AppTheme(
            id: "dark_pink", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: darkThemeData(primaryColor: Colors.pink)),
        AppTheme(
            id: "dark_purple", // Id(or name) of the theme(Has to be unique)
            description: "My Default Theme", // Description of theme
            data: darkThemeData(primaryColor: Colors.purple)),
      ];

  static ThemeData lightThemeData({Color primaryColor = Colors.orange}) {
    return ThemeData(
      appBarTheme:  AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: primaryColor,
        // foregroundColor: Colors.white //here you can give the text color
      ),
      radioTheme: RadioThemeData(fillColor: MaterialStatePropertyAll(kSecondaryColor)),
      iconTheme: const IconThemeData(color: kSecondaryColor),
      unselectedWidgetColor: Colors.grey,
      toggleableActiveColor: primaryColor,
      canvasColor: const Color(0xffffffff),
      primaryColorLight: Colors.black,
      indicatorColor: const Color(0xffeceff1),
      cardColor: const Color(0xffffffff),
      primaryColor: primaryColor,
      backgroundColor: const Color(0xffeceff1),
      scaffoldBackgroundColor: const Color(0xffF2FFFE),
      textTheme: TextTheme(
        headline1: GoogleFonts.notoSansMyanmar(
            textStyle: const TextStyle(color: Colors.black)),
        headline2: GoogleFonts.notoSansMyanmar(
            textStyle: const TextStyle(color: Colors.black)),
        bodyText1: GoogleFonts.notoSansMyanmar(
            textStyle: const TextStyle(color: Colors.black)),
        bodyText2: GoogleFonts.notoSansMyanmar(
            textStyle: const TextStyle(color: Colors.black)),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    );
  }

  static ThemeData darkThemeData({Color primaryColor = Colors.orange}) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Color.fromARGB(255, 34, 32, 32),

        // foregroundColor: Colors.white //here you can give the text color
      ),
      iconTheme: const IconThemeData(color: Colors.grey),
      unselectedWidgetColor: Colors.grey,
      toggleableActiveColor: primaryColor,
      canvasColor: const Color.fromARGB(250, 50, 50, 50),
      primaryColorLight: Colors.white,
      indicatorColor: const Color.fromARGB(255, 34, 32, 32).withOpacity(0.9),
      cardColor: const Color.fromARGB(250, 50, 50, 50),
      primaryColor: primaryColor,
      backgroundColor: const Color.fromARGB(255, 34, 32, 32),
      scaffoldBackgroundColor: const Color.fromARGB(255, 34, 32, 32),
      textTheme: TextTheme(
        headline1: GoogleFonts.notoSansMyanmar(
            textStyle: const TextStyle(color: Colors.white)),
        headline2: GoogleFonts.notoSansMyanmar(
            textStyle: const TextStyle(color: Colors.white)),
        bodyText1: GoogleFonts.notoSansMyanmar(
            textStyle: const TextStyle(color: Colors.white)),
        bodyText2: GoogleFonts.notoSansMyanmar(
            textStyle: const TextStyle(color: Colors.white)),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
    );
  }
}
