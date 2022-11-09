import 'package:flutter/material.dart';
import 'package:inter_war/model/model.dart';

typedef TraitsController = Map<String, bool>;

class TraitsInput extends StatefulWidget {
  const TraitsInput({
    Key? key,
    required this.traitsController,
  }) : super(key: key);

  final TraitsController traitsController;

  static TraitsController createController() {
    return Trait.values.map(
      (key, value) => MapEntry(key, false),
    );
  }

  @override
  State<TraitsInput> createState() => _TraitsInputState();
}

class _TraitsInputState extends State<TraitsInput> {
  List<Widget> _getTraitsCollection() {
    return widget.traitsController.keys
        .map(
          (trait) => CheckboxListTile(
            title: Text(trait),
            onChanged: (bool? value) {
              widget.traitsController[trait] = value ?? false;
              setState(() {});
            },
            value: widget.traitsController[trait],
          ),
        )
        .toList();
  }

  Widget _getTraitsInputLabel() => const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          "A pessoa era:",
          textAlign: TextAlign.left,
        ),
      );

  Widget _getTraitsInput() {
    return Column(
      children: [
        _getTraitsInputLabel(),
        ..._getTraitsCollection(),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getTraitsInput();
  }
}
