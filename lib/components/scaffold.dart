import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WarScaffold extends StatelessWidget {
  const WarScaffold({
    required this.child,
    this.title = "War Inter 2022",
    this.padding = const EdgeInsets.all(15.0),
    this.withAppBar = true,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final String title;
  final EdgeInsetsGeometry padding;
  final bool withAppBar;

  bool isIOS() => defaultTargetPlatform == TargetPlatform.iOS;

  Text _getTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline1,
    );
  }

  SafeArea _getBody() {
    return SafeArea(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: withAppBar
          ? AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: isIOS() ? 0.2 : 2,
              centerTitle: isIOS(),
              title: _getTitle(context),
            )
          : null,
      body: _getBody(),
    );
  }
}
