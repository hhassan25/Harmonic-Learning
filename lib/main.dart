import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:harmonic_learning/pages/studentDashboard.dart';
import 'package:overlay_support/overlay_support.dart';
import 'Routes/Custom_Router.dart';
import 'Routes/Route_Names.dart';
import 'localization/demo_localization.dart';
import 'pages/login.dart';
import 'pages/loading.dart';
import 'pages/profile.dart';

void main() async {
  runApp(OverlaySupport(child: MyApp()));
  /*WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var username = preferences.getString('username');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: username == null ? HomePage() : mainDashboard(),
  ));*/
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  final String str;
  const MyApp({Key key, this.str}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: _locale,
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
      localizationsDelegates: [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode &&
              locale.countryCode == deviceLocale.countryCode)
            return deviceLocale;
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRoute.allRoutes,
      initialRoute: homeRoute,
    );
  }
}
