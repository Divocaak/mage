class Player {
  int id;
  String username;
  int level;
  String levelName;

  Player(this.id, this.username, this.level, this.levelName);

  factory Player.fromJson(json) => Player(int.parse(json["id"]),
      json["username"], int.parse(json["level"]), json["levelName"]);

  String writeNameWithLevel() =>
      username + " (" + level.toString() + ": " + levelName + ")";
}
