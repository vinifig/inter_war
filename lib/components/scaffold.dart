import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inter_war/routes/routes.dart';

class WarScaffold extends StatelessWidget {
  const WarScaffold({
    required this.child,
    this.title = "War Inter 2022",
    this.padding = const EdgeInsets.all(15.0),
    this.withAppBar = true,
    this.canNavigateToAddKiss = false,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final String title;
  final EdgeInsetsGeometry padding;
  final bool withAppBar;
  final bool canNavigateToAddKiss;

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

  void _navigateToKissScreen(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.addKiss);
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
              actions: [
                if (canNavigateToAddKiss)
                  IconButton(
                    onPressed: () => _navigateToKissScreen(context),
                    icon: const Icon(
                      Icons.add,
                    ),
                  )
              ],
            )
          : null,
      body: _getBody(),
      floatingActionButton: canNavigateToAddKiss
          ? FloatingActionButton(
              onPressed: () => _navigateToKissScreen(context),
              tooltip: 'Cadastrar beijo',
              child: const Icon(Icons.add),
              backgroundColor: Colors.green,
            )
          : null,
    );
  }
}
