import 'package:code_sample_demo/common/gloabels.dart';
import 'package:code_sample_demo/providers/app_provider.dart';
import 'package:code_sample_demo/ui/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'common/firebase_utils.dart';
import 'localizations/app_localization.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    firebaseUtils ??= FirebaseUtils();
  } catch (e) {
    print('Exception at main $e');
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: Size(375, 812),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          primaryColor: Colors.lightGreen.shade300,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            brightness: Brightness.light,
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.lightGreen,
          primaryColor: Colors.lightGreen.shade300,
          errorColor: Colors.redAccent.shade100,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            brightness: Brightness.dark,
          ),
        ),
        themeMode:
            Provider.of<AppProvider>(context, listen: true).darkModeEnable
                ? ThemeMode.dark
                : ThemeMode.light,
        locale: Provider.of<AppProvider>(context, listen: true).appLocal,
        supportedLocales: [Locale('en', 'US'), Locale('hi', 'IN')],
        localizationsDelegates: [
          StringLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        home: SplashScreen(),
      ),
    );
  }
}
