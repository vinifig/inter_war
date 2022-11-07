import 'package:flutter/material.dart';

import '../components/scaffold/scaffold.dart';

const initialRoute = "/";
const setupRoute = "/setup";

final warRoutes = <String, Widget Function(BuildContext)>{
  initialRoute: (BuildContext context) => const WarScaffold(
        child: Text("Hello, World!"),
        title: "home",
      ),
  setupRoute: (BuildContext context) => const WarScaffold(
        child: Text("Hello, World!"),
        title: "setup",
      ),
};
