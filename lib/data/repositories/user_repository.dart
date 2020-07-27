import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:online_store/data/apis/user_api.dart';
import 'package:online_store/data/models/user.dart';
import 'package:online_store/helpers/env/env_helper.dart';

class UserRepository {
  Future<User> login(String username, String password) async {
    final response = await http.get(
        EnvHelper.getApiURL(
            EnvHelper.host, EnvHelper.port, UserApi.login(username, password)),
        headers: {
          'accept': 'aplication/json',
          'content-Type': 'application/json'
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> user = json.decode(response.body);
      return User.fromJson(user);
    } else {
      throw Exception('Failed to login');
    }
  }
}
