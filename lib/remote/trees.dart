import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mage/objects/tree.dart';
import 'package:mage/remote/settings.dart';

class RemoteTrees {
  static Future<List<Tree>?> getTreesAll(String playerId) async {
    final Response response = await post(
        Uri.parse(Uri.encodeFull(baseUrl + "/tree/getAll.php")),
        headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8"},
        body: {"playerId": playerId});
    return response.statusCode == 200
        ? jsonDecode(response.body)
            .cast()
            .map<Tree>((tree) => Tree.fromJson(tree))
            .toList()
        : null;
  }
}
