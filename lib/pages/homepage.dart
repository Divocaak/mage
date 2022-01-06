import 'package:flutter/material.dart';
import 'package:mage/objects/player.dart';
import 'package:mage/objects/tree.dart';
import 'package:mage/remote/trees.dart';
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

  late Future<List<Tree>?> trees;

  @override
  void initState() {
    wins = widget._player.getWins(recalc: true);
    loses = widget._player.getLoses(recalc: true);
    winRate = widget._player.getWinRate();
    trees = RemoteTrees.getTreesAll(widget._player.id.toString());
    super.initState();
  }

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
            child: const Icon(Icons.logout))
      ]),
      const Text("Element trees"),
      SizedBox(
          height: 50,
          child: FutureBuilder<List<Tree>?>(
              future: trees,
              builder: (context, snapshot) =>
                  (snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : (snapshot.hasData
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, i) =>
                                  snapshot.data![i].goToTreeButton(context))
                          : (snapshot.hasError
                              ? const Icon(Icons.error)
                              : const Icon(Icons.check_box_outline_blank)))))),
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
