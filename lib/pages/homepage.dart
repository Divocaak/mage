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
  late int wins = 0;
  late int loses = 0;
  late double winRate = 0;

  @override
  Widget build(BuildContext context) {
    wins = widget._player.getWins(recalc: true);
    loses = widget._player.getLoses(recalc: true);
    winRate = widget._player.getWinRate();
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text("Logged as " + widget._player.writeNameWithLevel()),
        TextButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SignLogin())),
            child: const Icon(Icons.logout))
      ]),
      const Text("Element trees"),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextButton(onPressed: () {}, child: const Icon(Icons.fireplace)),
        TextButton(onPressed: () {}, child: const Icon(Icons.water)),
        TextButton(onPressed: () {}, child: const Icon(Icons.air)),
        TextButton(onPressed: () {}, child: const Icon(Icons.public))
      ]),
      const Text("Battles"),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text("Wins: " + wins.toString()),
        Text("Loses: " + loses.toString()),
        Text("Winrate: " + winRate.toString() + " %"),
        TextButton(
            onPressed: () => setState(() {}), child: const Icon(Icons.refresh))
      ]),
      TextButton(onPressed: () {}, child: const Text("Start new one")),
      const Text("Active battles"),
      const Text("Incoming attacks"),
      const Text("History"),
    ])));
  }
}
