import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/ui/components/test.dart';

import 'ui/screens/navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
        primaryColor: ColorHelper.textColor,
        accentColor: ColorHelper.textColor,
      ),
      home: Test(),
    );
  }
}
