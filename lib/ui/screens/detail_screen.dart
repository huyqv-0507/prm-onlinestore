import 'package:flutter/material.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/models/shoe.dart';
import 'package:online_store/ui/components/detail_body.dart';

class Details extends StatelessWidget {
  final Shoe shoe;

  const Details({Key key, this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorHelper.bgColor,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.grey[600],
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Detail',
          style: TextStyle(color: Colors.grey[600]),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: null),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)
        ],
      ),
      body: DetailBody(
        shoe: shoe,
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: RaisedButton(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Text(
                'Add to cart',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}