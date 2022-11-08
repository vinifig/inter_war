import 'package:flutter/material.dart';
import 'package:inter_war/components/components.dart';
import 'package:inter_war/model/model.dart';
import 'package:inter_war/routes/routes.dart';
import 'package:inter_war/services/services.dart';
import 'package:inter_war/types/types.dart';
import 'package:uuid/uuid.dart';

class Setup extends StatelessWidget {
  Setup({
    required this.userService,
    Key? key,
  }) : super(key: key);

  final UserService userService;

  final nameController = TextEditingController();
  final campusController = CampusController(null);

  Widget _welcomeMessage(ThemeData theme) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Parabéns por participar deste evento incrível",
          style: theme.textTheme.headline2!,
        ),
      );

  Widget _setupMessage() => const Padding(
        padding: EdgeInsets.only(bottom: 32.0),
        child: Text(
          "Por favor, preencha as informações para que possamos começar!",
        ),
      );

  CampusInput _getCampusInput() {
    return CampusInput(
      controller: campusController,
      label: "Selecione seu campus:",
    );
  }

  Padding _getNameInput() => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextInput(
          label: "Como devemos te chamar?",
          controller: nameController,
        ),
      );

  void _showFailureMessage(BuildContext context, String field) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => Alert(
        title: "Preencha os campos",
        content: "O campo $field não está preenchido",
      ),
    );
  }

  Future<void> _createUser() async {
    final user = User(
      name: nameController.text,
      campus: campusController.value!,
      privateId: const Uuid().v4().toString(),
    );

    await userService.update(user);
  }

  Future<void> _confirm(BuildContext context) async {
    if (nameController.text == "") {
      return _showFailureMessage(context, "Nome");
    }

    if (campusController.value == null) {
      return _showFailureMessage(context, "Campus");
    }

    await _createUser();
    await Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.home,
      (route) => false,
    );
  }

  Widget _getConfirmButton(BuildContext context) => SizedBox(
        child: ElevatedButton(
          onPressed: () => _confirm(context),
          child: const Text("Continuar"),
        ),
        width: double.infinity,
      );

  Widget _getForm(BuildContext context) {
    return Column(children: [
      _welcomeMessage(Theme.of(context)),
      _setupMessage(),
      _getNameInput(),
      _getCampusInput(),
      _getConfirmButton(context),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WarScaffold(
      child: _getForm(context),
    );
  }
}
