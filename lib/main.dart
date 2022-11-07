import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interunesp_war/routes/routes.dart';
import 'package:interunesp_war/theme/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  runZonedGuarded(() {
    runApp(const InterUnespWar());
  }, (Object error, StackTrace stack) {});
}

class InterUnespWar extends StatefulWidget {
  const InterUnespWar({
    Key? key,
  }) : super(key: key);

  @override
  InterUnespWarState createState() => InterUnespWarState();
}

class InterUnespWarState extends State<InterUnespWar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'War Inter',
      theme: WarTheme.lightTheme,
      initialRoute: initialRoute,
      routes: warRoutes,
    );
  }
}
