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
      case templatesRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => TemplatesPage(data));
      case templateLifePath:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LifePath(data));
      case rolePage:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => RolePart(data));
      case LifePath2Page:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LifePath2(data));
      case LifePath3Page:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LifePath3(data));
      case friendsRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Friends(data));
      case enemiesRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Enemies(data));
      case lifeGoalsRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LifeGoals(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
