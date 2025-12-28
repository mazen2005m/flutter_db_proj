import 'dart:convert';

import 'package:db_proj/core/configs/api_configs.dart';
import 'package:db_proj/core/models/user.dart';
import 'package:http/http.dart' as http;

class UserApiController {
  Future<List<User>> getAllUsers() async {
    Uri uri = Uri.parse(ApiConfigs.user);
    var stringResponse = await http.get(uri);
    if(stringResponse.statusCode == 200) {
      var jsonResponse = jsonDecode(stringResponse.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((jsonObj) => User.from(jsonObj)).toList();
    }
    return [];
  }

}