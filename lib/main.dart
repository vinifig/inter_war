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

class InterUnespWar extends StatelessWidget {
  const InterUnespWar({
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
