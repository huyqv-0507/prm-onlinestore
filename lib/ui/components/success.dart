import 'package:flutter/material.dart';
import 'package:online_store/helpers/paddings/padding_helper.dart';
import 'package:online_store/ui/screens/navigation_bar.dart';

class SuccessNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/vnpay.png'),
                ),
                Text('Successfully')
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(5),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationBar())),
                    child: Text(
                      'Done',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )))));
  }
}
