import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mage/objects/player.dart';
import 'package:mage/remote/settings.dart';

class RemoteSign {
  // TODO register
  // BUG wrong credentials
  static Future<Player?> login(String username, String password) async {
    final Response response = await post(
        Uri.parse(Uri.encodeFull(baseUrl + "/sign/login.php")),
        headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8"},
        body: {"username": username, "password": password});
    return response.statusCode == 200 && response.body != "ERROR"
        ? Player.fromJson(jsonDecode(response.body))
        : null;
  }
}
