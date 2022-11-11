import 'package:flutter/material.dart';
import 'package:inter_war/pages/pages.dart';
import 'package:inter_war/services/services.dart';

class Routes {
  static const home = "/";
  static const setup = "/setup";
  static const addKiss = "/add-kiss";
}

final warRoutes = <String, Widget Function(BuildContext)>{
  Routes.home: (BuildContext context) {
    return Home(
      userService: UserService.base(),
    );
  },
  Routes.setup: (BuildContext context) => Setup(
        userService: UserService.base(),
      ),
  Routes.addKiss: (BuildContext context) => AddKiss(
        userService: UserService.base(),
      ),
};
