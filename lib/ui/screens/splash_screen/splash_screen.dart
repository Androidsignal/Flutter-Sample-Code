import 'dart:convert';

import 'package:code_sample_demo/api/api_config.dart';
import 'package:code_sample_demo/common/gloabels.dart';
import 'package:code_sample_demo/local_model.dart';
import 'package:code_sample_demo/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:code_sample_demo/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  final bool isForLock;

  const SplashScreen({Key key, this.isForLock}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    preference.then((value) {
      LocalModel localModel =
          new LocalModel.fromJson(jsonDecode(value.get(ApiConfig.mainLocal)));
      if (localModel != null &&
          localModel.languageCode != null &&
          localModel.languageCode.isNotEmpty) {
        context.read<AppProvider>().setAppLocale(Locale(localModel.languageCode, localModel.countryCode));
        context.read<AppProvider>().setAppMode(value.getBool(ApiConfig.mainMode)??false);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        navigateAndRemove(context, HomeScreen());
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/image/app_icon.png',
          width: 150.r,
          height: 150.r,
        ),
      ),
    );
  }

}
