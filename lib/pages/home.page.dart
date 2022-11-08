import 'package:flutter/material.dart';
import 'package:inter_war/components/components.dart';
import 'package:inter_war/routes/routes.dart';
import 'package:inter_war/services/services.dart';

class Home extends StatelessWidget {
  const Home({
    required this.userService,
    Key? key,
  }) : super(key: key);

  final UserService userService;

  Future<void> goToSetupIfNeeded(BuildContext context) async {
    final hasUser = await userService.hasUser();

    if (!hasUser) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.setup,
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    goToSetupIfNeeded(context);
    return const WarScaffold(
      child: Text("Hello, World!"),
    );
  }
}
