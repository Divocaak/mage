import 'package:flutter/material.dart';
import 'package:mage/pages/treepage.dart';

class Tree {
  int id;
  int pointsSpent;
  int typeId;
  String typeName;

  Tree(this.id, this.pointsSpent, this.typeId, this.typeName);

  factory Tree.fromJson(json) => Tree(int.parse(json["id"]),
      int.parse(json["spent"]), int.parse(json["type"]), json["name"]);

  IconData iconResolver() {
    switch (typeId) {
      case 1:
        return Icons.fireplace;
      case 2:
        return Icons.water;
      case 3:
        return Icons.public;
      case 4:
        return Icons.air;
      default:
        return Icons.warning;
    }
  }

  Widget goToTreeButton(context) => TextButton(
      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TreePage(tree: this))),
      child: Icon(iconResolver()));
}
