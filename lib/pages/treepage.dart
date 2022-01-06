import 'package:flutter/material.dart';
import 'package:mage/objects/tree.dart';

class TreePage extends StatefulWidget {
  const TreePage({Key? key, required Tree tree})
      : _tree = tree,
        super(key: key);

  final Tree _tree;

  @override
  State<TreePage> createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back)),
      Text(widget._tree.typeName),
      Text("Spent points: " + widget._tree.pointsSpent.toString()),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextButton(onPressed: () {}, child: const Icon(Icons.add)),
        TextButton(onPressed: () {}, child: const Icon(Icons.remove)),
      ]),
      /* ListView(children: [
        TextButton(onPressed: () {}, child: const Text("back")),
        TextButton(onPressed: () {}, child: const Text("back")),
      ]) */
    ])));
  }
}
