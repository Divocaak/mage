import 'package:flutter/material.dart';
import 'package:mage/objects/player.dart';
import 'package:mage/pages/homepage.dart';
import 'package:mage/remote/sign.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key, required String username, required String password})
      : _username = username,
        _password = password,
        super(key: key);

  final String _username;
  final String _password;

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late Future<Player?> player;
  @override
  Widget build(BuildContext context) {
    player = RemoteSign.login(widget._username, widget._password);
    return SafeArea(
        child: Scaffold(
            body: FutureBuilder<Player?>(
                future: player,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Future.delayed(
                        Duration.zero,
                        () async => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(player: snapshot.data!))));
                  } else if (snapshot.hasError) {
                    return Column(children: [
                      const Text("Někde se stala chyba, zkuste to později."),
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Go back"))
                    ]);
                  }

                  return const Center(child: CircularProgressIndicator());
                })));
  }
}
