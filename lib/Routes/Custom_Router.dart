import 'package:flutter/material.dart';
import 'package:harmonic_learning/pages/evaluateProject.dart';
import 'package:harmonic_learning/pages/studentDashboard.dart';
import '../pages/loading.dart';
import 'Route_Names.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Loading());

      /*case settingsRoute:
        return MaterialPageRoute(builder: (_) => settingsPage());*/

    }

    //return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
