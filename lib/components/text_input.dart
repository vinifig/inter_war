import 'package:flutter/material.dart';

const _inputPadding = 20.0;

class TextInput extends StatelessWidget {
  const TextInput({
    required this.controller,
    required this.label,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  OutlineInputBorder _getBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      textAlignVertical: TextAlignVertical.bottom,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: _getBorder(
          color: theme.hintColor,
        ),
        focusedBorder: _getBorder(
          color: theme.primaryColor,
        ),
        border: _getBorder(
          color: theme.hintColor,
        ),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(_inputPadding),
        labelText: label,
        hintStyle: TextStyle(color: theme.hintColor),
      ),
    );
  }
}
