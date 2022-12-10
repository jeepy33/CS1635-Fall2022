import 'package:flutter/material.dart';
import 'view/all.dart';

import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const Home());
      case newCharRoute:
        return MaterialPageRoute(builder: (_) => const NewChar());
      case editCharRoute:
        return MaterialPageRoute(builder: (_) => const EditChar());
      case templatesRoute:
        return MaterialPageRoute(builder: (_) => const RolesPage());
      case templateLifePath:
        return MaterialPageRoute(builder: (_) => const OriginPage());
      case styleRoute:
        return MaterialPageRoute(builder: (_) => const StylePage());
      case motivationsRoute:
        return MaterialPageRoute(builder: (_) => const MotivationsPage());
      case familyRoute:
        return MaterialPageRoute(builder: (_) => const FamilyPage());
      case environmentRoute:
        return MaterialPageRoute(builder: (_) => const EnvironmentPage());
      case friendsRoute:
        return MaterialPageRoute(builder: (_) => const Friends());
      case enemiesRoute:
        return MaterialPageRoute(builder: (_) => const Enemies());
      case lifeGoalsRoute:
        return MaterialPageRoute(builder: (_) => const LifeGoalsPage());
      case statsRoute:
        return MaterialPageRoute(builder: (_) => const StatsPage());
      case skillsRoute:
        return MaterialPageRoute(builder: (_) => const SkillsPage());
      case inventoryRoute: //inventory page
        return MaterialPageRoute(builder: (_) => const InventoryPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
