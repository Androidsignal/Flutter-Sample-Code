import 'dart:convert';

import 'package:code_sample_demo/api/api_config.dart';
import 'package:code_sample_demo/common/color_constant.dart';
import 'package:code_sample_demo/common/gloabels.dart';
import 'package:code_sample_demo/common/text_util_constant.dart';
import 'package:code_sample_demo/local_model.dart';
import 'package:code_sample_demo/localizations/app_localization.dart';
import 'package:code_sample_demo/providers/app_provider.dart';
import 'package:code_sample_demo/ui/common_widgte/menu_button_widgte.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences preferences;

  @override
  void initState() {
    preference.then((value) {
      preferences = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool changeLNG = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: IconButton(
            onPressed: () {
              bool darkModeEnable =
                  Provider.of<AppProvider>(context,listen: false).darkModeEnable ?? false;

              Provider.of<AppProvider>(context,listen: false).setAppMode(!darkModeEnable);
              preferences.setBool(ApiConfig.mainMode, !darkModeEnable);
            },
            icon: Icon(
                Provider.of<AppProvider>(context, listen: true).darkModeEnable
                    ? Icons.wb_incandescent_outlined
                    : Icons.wb_incandescent)),
        title: TitleText(
            text: StringLocalizations.of(context)
                .getText(stringKeys.codeGallery)),
        actions: [
          IconButton(
              icon: Icon(Icons.g_translate),
              onPressed: () {
                changeLNG = !changeLNG;

                if (changeLNG ?? false) {
                  context.read<AppProvider>().setAppLocale(Locale('en', 'US'));
                  preferences.setString(
                      ApiConfig.mainLocal,
                      jsonEncode(
                          LocalModel(countryCode: 'US', languageCode: 'en')
                              .toJson()));
                } else {
                  preferences.setString(
                      ApiConfig.mainLocal,
                      jsonEncode(
                          LocalModel(countryCode: 'IN', languageCode: 'hi')
                              .toJson()));
                  context.read<AppProvider>().setAppLocale(Locale('hi', 'IN'));
                }
              })
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          MenuButtonWidget(
              title: StringLocalizations.of(context)
                  .getText(stringKeys.firebaseAuth),
              imagePath: imageConstant.firebaseLogo),
          MenuButtonWidget(
              title: StringLocalizations.of(context)
                  .getText(stringKeys.httpFunctions),
              imagePath: imageConstant.httpLogo),
          MenuButtonWidget(
              title: StringLocalizations.of(context)
                  .getText(stringKeys.googleLogin),
              imagePath: imageConstant.googleLogin),
          MenuButtonWidget(
              title: StringLocalizations.of(context)
                  .getText(stringKeys.facebookLogin),
              imagePath: imageConstant.facebookLogin),
        ],
      ),
    );
  }
}
