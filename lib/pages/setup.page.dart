import 'package:flutter/material.dart';
import 'package:inter_war/components/components.dart';

class Setup extends StatelessWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WarScaffold(
      child: Text("Parabéns, agora você está participando do War do Inter"),
      title: "Configuração",
    );
  }
}
