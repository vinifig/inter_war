import 'package:flutter/material.dart';
import 'package:inter_war/components/components.dart';
import 'package:inter_war/services/user.service.dart';

class AddKiss extends StatelessWidget {
  const AddKiss({
    required this.userService,
    Key? key,
  }) : super(key: key);

  final UserService userService;

  @override
  Widget build(BuildContext context) {
    return const WarScaffold(
      title: "Adicionar Beijo",
      child: Text("oi"),
    );
  }
}
