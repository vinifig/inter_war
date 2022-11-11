import 'package:flutter/material.dart';
import 'package:inter_war/components/components.dart';
import 'package:inter_war/extensions/extensions.dart';
import 'package:inter_war/model/model.dart';
import 'package:inter_war/routes/routes.dart';
import 'package:inter_war/services/services.dart';

class Home extends StatefulWidget {
  const Home({
    required this.userService,
    Key? key,
  }) : super(key: key);

  final UserService userService;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? _user;
  bool loggingOut = false;

  Future<void> goToSetupIfNeeded(BuildContext context) async {
    final user = await widget.userService.get();

    if (user == null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.setup,
        (_) => false,
      );
      return;
    }
    setState(() {
      _user = user;
    });
  }

  Widget _getTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        children: [
          Text(
            "Olá, ${_user?.name}!",
          ),
          Text(
              "Seus pontos estão sendo calculados para o campus de ${_user?.campus.value.capitalize()}"),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget _pointsBox(String label, int points) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "$points",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPoints() {
    return Column(
      children: [
        _pointsBox("Beijos", _user?.kisses.length ?? 0),
        _pointsBox("Pontos", _user?.points ?? 0),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget _getActions() {
    const logoutMessage = "Tem certeza? Os beijos serão esquecidos. 😭😭😭";
    return Column(
      children: [
        if (loggingOut)
          const Text(
            logoutMessage,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.listKisses);
            },
            child: const Text(
              "Ver detalhes",
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (loggingOut) {
                widget.userService.logout();
                setState(() {
                  loggingOut = false;
                });
                return;
              }
              setState(() {
                loggingOut = true;
              });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: Text(
              loggingOut ? "Sim" : "Sair",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        if (loggingOut)
          Center(
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    loggingOut = false;
                  });
                },
                child: const Text("Cancelar"),
              ),
            ),
          )
      ],
    );
  }

  Widget _getHomeContent(BuildContext context) {
    return Column(
      children: [
        _getTitle(),
        _getPoints(),
        // TODO: fazer algo tipo: const Spacer(), -- n funciona pq scrollview é infinito
        const SizedBox(
          height: 50.0,
        ),
        _getActions(),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    goToSetupIfNeeded(context);

    return WarScaffold(
      child: SingleChildScrollView(child: _getHomeContent(context)),
      canNavigateToAddKiss: true,
    );
  }
}
