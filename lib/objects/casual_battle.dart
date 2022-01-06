import 'package:flutter/material.dart';
import 'package:mage/objects/player.dart';

class CasualBattle {
  int id;
  String start;
  String end;
  int winnerId;
  Player attacker;
  dynamic attack;
  Player defender;
  dynamic defense;
  bool attackerSeen;

  CasualBattle(this.id, this.start, this.end, this.winnerId, this.attacker,
      this.attack, this.defender, this.defense, this.attackerSeen);

  factory CasualBattle.fromJson(json) => CasualBattle(
      int.parse(json["id"]),
      json["start"],
      json["end"],
      int.parse(json["winnerId"]),
      json["attacker"],
      json["attack"],
      json["defender"],
      json["defense"],
      bool.fromEnvironment(json["attackerSeen"]));

  Player getOpponent(int myId) => myId == attacker.id ? defender : attacker;

  Card historyCard(int myId) => Card(
      color: Colors.white70,
      child: Column(children: [
        Text("Battle end: " + end),
        Text("Opponent: " + getOpponent(myId).username),
        Row(children: [
          const Text("Type: "),
          Icon(myId == attacker.id ? Icons.arrow_upward : Icons.arrow_downward)
        ]),
        Row(children: [
          const Text("Result: "),
          Icon(myId == winnerId
              ? Icons.emoji_events
              : Icons.sentiment_very_dissatisfied)
        ]),
        TextButton(onPressed: () {}, child: const Text("Details"))
      ]));
}
