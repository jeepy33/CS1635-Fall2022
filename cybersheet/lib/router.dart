import 'package:flutter/material.dart';
import 'main.dart';

import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case newCharRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => newChar(data));
      case editCharRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => editChar(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
