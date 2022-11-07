import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WarScaffold extends StatelessWidget {
  const WarScaffold({
    required this.child,
    required this.title,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final String title;

  bool isIOS() => defaultTargetPlatform == TargetPlatform.iOS;

  Text _getTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: isIOS() ? 0.2 : 2,
        centerTitle: isIOS(),
        title: _getTitle(context),
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
