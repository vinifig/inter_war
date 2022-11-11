import 'package:flutter/material.dart';
import 'package:inter_war/components/components.dart';
import 'package:inter_war/extensions/extensions.dart';
import 'package:inter_war/model/model.dart';
import 'package:inter_war/services/services.dart';

class ListKisses extends StatefulWidget {
  const ListKisses({
    required this.userService,
    Key? key,
  }) : super(key: key);

  final UserService userService;

  @override
  State<ListKisses> createState() => _ListKissesState();
}

class _ListKissesState extends State<ListKisses> {
  User? user;

  Future<void> _getKisses() async {
    final foundUser = await widget.userService.get();

    if (foundUser != null) {
      setState(() {
        user = foundUser;
      });
    }
  }

  @override
  void initState() {
    _getKisses();
    super.initState();
  }

  List<Widget> _getTraits(Kiss kiss) {
    return kiss.traits.map((e) => Text(e)).toList();
  }

  Widget _getKissListTile(Kiss kiss) {
    return Card(
      child: ListTile(
        title: Text(kiss.campus.value.capitalize()),
        subtitle: Column(
          children: [
            Text("Pontos: ${kiss.getPoints(user!.campus)}"),
            if (kiss.metadata != null) Text("Contato: ${kiss.metadata}"),
            Text("Hora: ${kiss.timestamp}"),
            const Divider(),
            ..._getTraits(kiss)
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  Widget _getKissesList() {
    return ListView(
      children: user?.kisses.map(_getKissListTile).toList() ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WarScaffold(
      child: _getKissesList(),
      title: "Beijos",
      padding: EdgeInsets.zero,
    );
  }
}
