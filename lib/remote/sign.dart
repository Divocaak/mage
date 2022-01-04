import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mage/remote/settings.dart';

class RemoteSign {
  static Future<Map<String, dynamic>?> login(
      String username, String password) async {
    final Response response = await post(
        Uri.parse(Uri.encodeFull(baseUrl + "/sign/login.php")),
        headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8"},
        body: {"username": username, "password": password});
    return response.statusCode == 200
        ? jsonDecode(response.body).cast<String, dynamic>()
        : null;
  }

  static Future<String?> register(String username, String password) async {
    final Response response = await post(
        Uri.parse(Uri.encodeFull(baseUrl + "/sign/register.php")),
        headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8"},
        body: {"username": username, "password": password});
    return response.statusCode == 200 ? response.body : null;
  }
}
