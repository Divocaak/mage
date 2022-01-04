import 'dart:io';
import 'package:http/http.dart';
import 'package:mage/remote/settings.dart';

class RemotePlayer {
  static Future<int> getWins(String id) async {
    final Response response = await post(
        Uri.parse(Uri.encodeFull(baseUrl + "/player/getWins.php")),
        headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8"},
        body: {"id": id});
    return response.statusCode == 200 ? int.parse(response.body) : 0;
  }

  static Future<int> getLoses(String id) async {
    final Response response = await post(
        Uri.parse(Uri.encodeFull(baseUrl + "/player/getLoses.php")),
        headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8"},
        body: {"id": id});
    return response.statusCode == 200 ? int.parse(response.body) : 0;
  }
}
