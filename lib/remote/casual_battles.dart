import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mage/objects/casual_battle.dart';
import 'package:mage/remote/settings.dart';

class RemoteCasualBattles {
  static Future<List<CasualBattle>?> getHistories(
      String username, String password) async {
    final Response response = await post(
        Uri.parse(Uri.encodeFull(baseUrl + "/casualBattles/getLogs.php")),
        headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8"},
        body: {"username": username, "password": password});
    if (response.statusCode == 200) {
      List<CasualBattle> toRet = [];
      Map<String, dynamic>? json = jsonDecode(response.body);
      json?["data"]
          .cast<String, dynamic>()
          .forEach((key, value) => toRet.add(CasualBattle.fromJson(value)));
      return toRet;
    } else {
      return null;
    }
  }
}
