import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http_provider/models/users.dart';

Future<ListUsers?> getUsersdata() async {
  ListUsers? result;
  try {
    final response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      final list = json.decode(response.body);
      result = ListUsers.fromJson(list);
    } else {
      print("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}
