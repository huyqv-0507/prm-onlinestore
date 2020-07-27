import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_store/data/models/user.dart';
import 'package:online_store/data/repositories/user_repository.dart';
import 'package:online_store/ui/screens/navigation_bar.dart';
import 'package:rxdart/subjects.dart';

class ProfileBloc {
  static ProfileBloc _profileBloc;
  static ProfileBloc getInstance() {
    return _profileBloc ?? (_profileBloc = ProfileBloc());
  }

  UserRepository _userRepository = UserRepository();
  User user;

  var loginController = BehaviorSubject();

  Stream get loginStream => loginController.stream;

  void login(BuildContext context, String username, String password) async {
    await _userRepository
        .login(username, password)
        .then((value) async => {
              user = value,
              loginController.sink.add('Login success'),
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => NavigationBar()))
            })
        .catchError((error) => {
              loginController.sink.addError('Account is invalid.'),
            });
  }

  void dispose() {
    loginController.close();
  }
}
