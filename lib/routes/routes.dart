import 'package:flutter/material.dart';

import '../components/scaffold/scaffold.dart';

const initialRoute = "/";

final warRoutes = <String, Widget Function(BuildContext)>{
  initialRoute: (BuildContext context) => const WarScaffold(
        child: Text("Hello, World!"),
        title: "home",
      ),
};
