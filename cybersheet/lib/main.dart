import 'package:cybersheet/presenter/presenter.dart';
import 'package:flutter/material.dart';

import 'router.dart' as local_router;
import 'constants.dart';
import 'view/all.dart';

Presenter presenter = Presenter();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Kontakt'), //line for default font
      home: const Scaffold(
        body: Home(),
      ),
      onGenerateRoute: local_router.Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
