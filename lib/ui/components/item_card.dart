import 'package:flutter/material.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/models/shoe.dart';

class ItemCard extends StatelessWidget {
  final Shoe _shoe;
  ItemCard(this._shoe);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 150,
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
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    height: 120,
                    child: Image.asset(
                      _shoe.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      width: 110,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_shoe.title),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  '${_shoe.price}\$',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${_shoe.price}\$',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(6))),
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
          ],
        ),
      ),
    );
  }
}
