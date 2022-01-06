import 'package:mage/remote/players.dart';

class Player {
  int id;
  String username;
  int level;
  String levelName;

  late int wins = -1;
  late int loses = -1;

  Player(this.id, this.username, this.level, this.levelName);

  factory Player.fromJson(json) => Player(int.parse(json["id"]),
      json["username"], int.parse(json["level"]), json["levelName"]);

  String writeNameWithLevel() =>
      username + " (" + level.toString() + ": " + levelName + ")";

  int getWins({bool recalc = false}) {
    if (wins < 0 || recalc) {
      RemotePlayer.getWins(id.toString())
          .then((int result) => wins = result, onError: (e) => wins = -1);
    }
    return wins;
  }

  int getLoses({bool recalc = false}) {
    if (loses < 0 || recalc) {
      RemotePlayer.getLoses(id.toString())
          .then((int result) => loses = result, onError: (e) => loses = -1);
    }
    return loses;
  }

  double getWinRate() => ((getWins(recalc: true) /
          (getWins(recalc: false) + getLoses(recalc: true))) *
      100);
}
