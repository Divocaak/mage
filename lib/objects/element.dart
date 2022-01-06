class Element {
  int id;
  String name;
  Map<String, dynamic> params;
  int tierId;
  String tierName;
  String typeName;

  Element(this.id, this.name, this.params, this.tierId, this.tierName,
      this.typeName);

  factory Element.fromJson(json) => Element(
      int.parse(json["id"]),
      json["name"],
      json["params"],
      int.parse(json["tierId"]),
      json["tierName"],
      json["typeName"]);
}
