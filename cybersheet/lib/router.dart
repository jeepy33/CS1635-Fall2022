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
        return MaterialPageRoute(builder: (_) => RolesPage(data));
      case templateLifePath:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LifePath(data));
      case styleRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => StylePage(data));
      case motivationsRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => MotivationsPage(data));
      case familyRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => FamilyPage(data));
      case environmentRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => EnvironmentPage(data));
      case friendsRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Friends(data));
      case enemiesRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Enemies(data));
      case lifeGoalsRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LifeGoalsPage(data));
      case statsRoute:
        return MaterialPageRoute(builder: (_) => StatsPage());
      case skillsRoute:
        return MaterialPageRoute(builder: (_) => SkillsPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
