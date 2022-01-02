import 'package:flutter/material.dart';
import 'package:mage/objects/player.dart';
import 'package:mage/sign/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required Player player})
      : _player = player,
        super(key: key);

  final Player _player;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text("Logged as " + widget._player.writeNameWithLevel()),
        TextButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SignLogin())),
            child: const Text("logout"))
      ]),
      const Text("Element trees"),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextButton(onPressed: () {}, child: const Icon(Icons.fireplace)),
        TextButton(onPressed: () {}, child: const Icon(Icons.water)),
        TextButton(onPressed: () {}, child: const Icon(Icons.air)),
        TextButton(onPressed: () {}, child: const Icon(Icons.public))
      ]),
      const Text("Battles"),
      TextButton(onPressed: () {}, child: const Text("Start new one")),
      const Text("Active battles"),
      const Text("Incoming attacks"),
      const Text("History"),
    ])));
  }
}
