import 'dart:async';

import 'package:code_sample_demo/localizations/hi_localizations.dart';
import 'package:flutter/material.dart';

import 'en_localizations.dart';

class StringLocalizations {
  final Locale appLocale;

  StringLocalizations(this.appLocale);

  static const LocalizationsDelegate<StringLocalizations> delegate = _ApplicationLocalizationsDelegate();

  static StringLocalizations of(BuildContext context) {
    return Localizations.of<StringLocalizations>(context, StringLocalizations);
  }

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    switch(appLocale.languageCode){
      case 'en':
        _localizedStrings = EnglishLocalizations().valueMap;
        break;
      case 'hi':
        _localizedStrings = HindiLocalizations().valueMap;
        break;
    }
    return true;
  }

  // called from every widget which needs a localized text
  String getText(String key) {
    return _localizedStrings[key]??'????';
  }
}
class _ApplicationLocalizationsDelegate extends LocalizationsDelegate<StringLocalizations>{
   const _ApplicationLocalizationsDelegate();

   @override
  bool isSupported(Locale locale){
     return ['en','hi'].contains(locale.languageCode);
   }

   @override
  Future<StringLocalizations> load(Locale locale){
     StringLocalizations applicationLocalizations = StringLocalizations(locale);
     applicationLocalizations.load();
     return Future.value(applicationLocalizations);
  }

   @override
  bool shouldReload(LocalizationsDelegate<StringLocalizations> old) {
     return false;
  }
}