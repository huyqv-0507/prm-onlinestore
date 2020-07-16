import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:online_store/data/models/role.dart';
import 'package:online_store/data/apis/role_api.dart';
import 'package:online_store/helpers/env/env_helper.dart';

class RoleRepository {
  Future<List<Role>> fetchRole() async {
    final response = await http.get(
        EnvHelper.getApiURL(EnvHelper.host, EnvHelper.port, RoleApi.getRoles),
        headers: {
          'accept': 'aplication/json',
          'content-Type': 'application/json'
        });

    if (response.statusCode == 200) {
      Iterable res = json.decode(response.body);
      List<Role> roles = res.map((json) => Role.fromJson(json)).toList();
      return roles;
    } else {
      throw Exception('Fail to fetch role');
    }
  }
}
