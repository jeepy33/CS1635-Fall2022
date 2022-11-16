import 'package:cybersheet/main.dart';

/// This file contains all constant variables used in the cybersheet application
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
String dropdownvalue = 'dart gun';
var items = ['dart gun', 'glock 17', 'AKR 20'];
const String homeRoute = '/';
const String newCharRoute = homeRoute + "new";
const String templatesRoute = newCharRoute + "/templates";
const String templateLifePath = rolePage + "/lifePath";
const String rolePage = templatesRoute + "/role";
const String confirmationRoute = templateLifePath + "confirm";
const String LifePath2Page = confirmationRoute + "lifePath2";
const String LifePath3Page = LifePath2Page + "lifePath3";
const String friendsRoute = LifePath3Page + "friends";
const String enemiesRoute = friendsRoute + "Enemies";
const String lifeGoalsRoute = enemiesRoute + "lifeGoals";
const String editCharRoute = homeRoute + "/edit";
