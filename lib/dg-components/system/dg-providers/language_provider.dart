import 'package:flutter/material.dart';

import '../../constants/globals.dart';

class LanguageProvider with ChangeNotifier {
  LanguageProvider() {
    start();
  }
  Locale locale = const Locale('en');

  start() {
    locale = Locale(storage.read('language') ?? locale.languageCode);
    if(storage.read('language')==null && storage.read('language')==''){
      storage.write('language','en');
    }
  }

  change({required languageCode}) {
    locale = Locale(languageCode);
    storage.write('language', languageCode);
    notifyListeners();
  }
}
