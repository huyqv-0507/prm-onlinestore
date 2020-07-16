import 'package:flutter/material.dart';
import 'package:online_store/blocs/role_bloc.dart';
import 'package:online_store/data/models/role.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  RoleBloc _roleBloc = RoleBloc.getInstance();

  @override
  void initState() {
    super.initState();
    _roleBloc.getRoles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            initialData: _roleBloc.roles,
            stream: _roleBloc.roleStream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Role> roles = snapshot.data;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: roles.length,
                    itemBuilder: (context, index) {
                      return Text('${roles[index].roleName}');
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
