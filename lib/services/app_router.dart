import 'package:flutter/material.dart';
import 'package:to_do_bloc_app/screens/recycle_bin.dart';
import 'package:to_do_bloc_app/screens/tab_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case TabScreen.id:
        return MaterialPageRoute(builder: (_) => const TabScreen());
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      default:
        null;
    }
    return null;
  }
}
