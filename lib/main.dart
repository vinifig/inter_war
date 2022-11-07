import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interunesp_war/routes/routes.dart';
import 'package:interunesp_war/services/services.dart';
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

  Future<void> initializeApp() async {
    final hasUser = await UserService(
      storageService: StorageService(),
    ).hasUser();
    if (!hasUser) {
      print('navigating');
      await Future.delayed(const Duration(seconds: 5));
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(setupRoute, (_) => false);
    }
  }

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
