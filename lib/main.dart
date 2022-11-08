import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inter_war/routes/routes.dart';
import 'package:inter_war/theme/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  runZonedGuarded(() {
    runApp(const InterWar());
  }, (Object error, StackTrace stack) {});
}

class InterWar extends StatelessWidget {
  const InterWar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'War Inter',
      theme: WarTheme.lightTheme,
      initialRoute: Routes.home,
      routes: warRoutes,
    );
  }
}
