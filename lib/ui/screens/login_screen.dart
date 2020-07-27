import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_store/blocs/profile_bloc.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/helpers/paddings/padding_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ProfileBloc _profileBloc = ProfileBloc.getInstance();
  Size size;

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.bgColor,
        body: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logo('assets/images/logo.png', 'SofmS'),
                    verticalSpace(10),
                    TextField(
                      controller: txtUsername,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                    verticalSpace(10),
                    TextField(
                      controller: txtPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    verticalSpace(5),
                    StreamBuilder(
                        initialData: Container(),
                        stream: _profileBloc.loginStream,
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? Container()
                              : Text(
                                  snapshot.error.toString(),
                                  style: TextStyle(color: Colors.red),
                                );
                        }),
                    verticalSpace(20),
                    FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => _profileBloc.login(
                          context, txtUsername.text, txtPassword.text),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: .3,
                                  color: Colors.grey),
                            ]),
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(10),
                    FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: null,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: .3,
                                  color: Colors.white),
                            ]),
                        child: Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customDivide(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('or'),
                        ),
                        customDivide()
                      ],
                    ),
                    verticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: null,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorHelper.bgColor,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: .3,
                                      color: Colors.grey),
                                ]),
                            child: Icon(
                              MdiIcons.google,
                              color: ColorHelper.googleColor,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: null,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorHelper.bgColor,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: .3,
                                      color: Colors.grey),
                                ]),
                            child: Icon(
                              MdiIcons.facebook,
                              color: ColorHelper.facebookColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget logo(String imageURL, String nameStore) {
    return SizedBox(
      width: size.width * 3 / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageURL,
            fit: BoxFit.cover,
            width: 90,
            height: 90,
          ),
          Center(
            child: Text(
              nameStore,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox verticalSpace(double value) {
    return SizedBox(
      height: value,
    );
  }

  Container customDivide() {
    return Container(
      width: 80,
      height: 1,
      color: Colors.grey,
    );
  }

  @override
  void dispose() {
    _profileBloc.dispose();
    super.dispose();
  }
}
