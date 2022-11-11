import 'package:flutter/material.dart';
import 'package:inter_war/components/components.dart';
import 'package:inter_war/model/model.dart';
import 'package:inter_war/services/user.service.dart';
import 'package:inter_war/types/types.dart';

class AddKiss extends StatelessWidget {
  AddKiss({
    required this.userService,
    Key? key,
  }) : super(key: key);

  final UserService userService;
  final CampusController _campusController = CampusController(null);
  final TraitsController _traitsController = TraitsInput.createController();
  final TextEditingController _metadataController = TextEditingController();

  Widget _getCampusInput() {
    return CampusInput(
        controller: _campusController, label: "De onde é quem você beijou?");
  }

  Widget _getTraitsInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: TraitsInput(
        traitsController: _traitsController,
      ),
    );
  }

  void _showFailureMessage(BuildContext context, String field) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => Alert(
        title: "Preencha os campos",
        content: "O campo $field não está preenchido",
      ),
    );
  }

  Future<void> _addKiss(BuildContext context) async {
    if (_campusController.value == null) {
      _showFailureMessage(context, "Campus");
      return;
    }

    final kiss = Kiss(
      timestamp: DateTime.now().toString(),
      campus: _campusController.value!,
      metadata: _metadataController.text,
      traits: _traitsController.entries
          .where((element) => element.value)
          .map((element) => element.key)
          .toList(),
    );
    await userService.addKiss(kiss);

    Navigator.of(context).pop();
  }

  Widget _getAddInput(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => _addKiss(context),
        child: const Text("Adicionar beijo"),
      ),
    );
  }

  Widget _getMetadataInput() {
    return TextInput(
      controller: _metadataController,
      label: "Adicione informações de contato",
    );
  }

  Widget _getForm(BuildContext context) {
    return Column(
      children: [
        _getCampusInput(),
        _getTraitsInput(),
        _getMetadataInput(),
        _getAddInput(context),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    _campusController.value = null;
    return WarScaffold(
      title: "Novo Beijo",
      child: SingleChildScrollView(child: _getForm(context)),
    );
  }
}
