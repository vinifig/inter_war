import 'package:flutter/material.dart';
import 'package:inter_war/pages/pages.dart';
import 'package:inter_war/services/services.dart';

class Routes {
  static const home = "/";
  static const setup = "/setup";
}

final warRoutes = <String, Widget Function(BuildContext)>{
  Routes.home: (BuildContext context) => Home(
        userService: UserService.base(),
      ),
  Routes.setup: (BuildContext context) => const Setup(),
};
