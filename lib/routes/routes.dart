import 'package:flutter/material.dart';
import 'package:interunesp_war/pages/pages.dart';
import 'package:interunesp_war/services/services.dart';

const homeRoute = "/";
const setupRoute = "/setup";

final warRoutes = <String, Widget Function(BuildContext)>{
  homeRoute: (BuildContext context) => Home(userService: UserService.base()),
  setupRoute: (BuildContext context) => const Setup(),
};
