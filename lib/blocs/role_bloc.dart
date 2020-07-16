import 'dart:async';

import 'package:online_store/data/models/role.dart';
import 'package:online_store/data/repositories/role_repository.dart';

class RoleBloc {
  static RoleBloc _roleBloc;
  static RoleBloc getInstance() {
    return _roleBloc ?? (_roleBloc = RoleBloc());
  }

  List<Role> roles;

  StreamController _rolesController = StreamController.broadcast();

  Stream get roleStream => _rolesController.stream;
  RoleRepository _roleRepository = RoleRepository();

  void getRoles() {
    if (roles == null) {
      _roleRepository
          .fetchRole()
          .then((value) => {roles = value, _rolesController.sink.add(roles)})
          .catchError((e) {
        print('getRoles error' + e.toString());
      });
    }
  }

  void dispose() {
    _rolesController.close();
  }
}
