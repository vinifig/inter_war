import 'package:flutter/material.dart';
import 'package:inter_war/extensions/extensions.dart';
import 'package:inter_war/model/campus.model.dart';
import 'package:inter_war/types/types.dart';

class CampusInput extends StatelessWidget {
  const CampusInput({
    required this.controller,
    this.label,
    Key? key,
  }) : super(key: key);

  final CampusController controller;
  final String? label;
  final campuses = Campus.values;

  List<DropdownMenuItem<Campus?>> _getDropdownMenuItems() {
    return campuses
        .map((campi) => DropdownMenuItem(
              child: Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Text(campi.value.capitalize()),
              ),
              value: campi,
            ))
        .toList();
  }

  DropdownButtonFormField _getDropdownButton() {
    return DropdownButtonFormField(
      items: _getDropdownMenuItems(),
      hint: Text(label ?? "Selecione o campus"),
      onChanged: (value) {
        controller.value = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getDropdownButton();
  }
}
