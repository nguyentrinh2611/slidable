import 'package:flutter/material.dart';
import 'package:slidable/routes/routes_path.dart';
import 'package:slidable/views/home_screen.dart';
import 'package:slidable/views/list_item.dart';

class RoutesApp {
  static Route generateRoutes(RouteSettings route) {
    switch (route.name) {
      case RoutesPath.HomePage:
        return buildRoutes(const HomeScreen(), route);
      case RoutesPath.ListItem:
        return buildRoutes(const ListItem(), route);
      default:
        return buildRoutes(const HomeScreen(), route);
    }
  }

  static buildRoutes(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
