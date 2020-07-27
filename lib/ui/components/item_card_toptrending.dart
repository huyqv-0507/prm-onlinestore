import 'package:flutter/material.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/models/shoe.dart';

class ItemCardTopTrending extends StatelessWidget {
  final Shoe _shoe;
  ItemCardTopTrending(this._shoe);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 160,
      height: 200,
      /*decoration: BoxDecoration(
        color: ColorHelper.bgItemColor,
        borderRadius: BorderRadius.circular(6),
      ),*/
      decoration: BoxDecoration(
          color: ColorHelper.bgItemColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 4, spreadRadius: .3, color: Colors.grey),
          ]),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 130,
              child: Image.asset(
                _shoe.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                  alignment: Alignment.centerLeft, child: Text(_shoe.title)),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${_shoe.price}\$',
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${_shoe.price}\$',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(6))),
            child: Center(
              child: Text(
                '70%',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.all(6),
            child: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        )
      ]),
    );
  }
}
