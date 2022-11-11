import 'package:flutter/material.dart';
import 'package:inter_war/pages/list_kisses.page.dart';
import 'package:inter_war/pages/pages.dart';
import 'package:inter_war/services/services.dart';

class Routes {
  static const home = "/";
  static const setup = "/setup";
  static const addKiss = "/add-kiss";
  static const listKisses = "/list-kisses";
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
  Routes.listKisses: (BuildContext context) => ListKisses(
        userService: UserService.base(),
      ),
};
