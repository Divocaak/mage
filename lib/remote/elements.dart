import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mage/objects/element.dart';
import 'package:mage/remote/settings.dart';

class RemoteTrees {
  static Future<List<Element>?> getElementsAll(String playerId) async {
    final Response response = await post(
        Uri.parse(Uri.encodeFull(baseUrl + "/element/getAll.php")),
        headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8"},
        body: {"playerId": playerId});
    return response.statusCode == 200
        ? jsonDecode(response.body)
            .cast()
            .map<Element>((element) => Element.fromJson(element))
            .toList()
        : null;
  }
}
