import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:online_store/blocs/detail_bloc.dart';
import 'package:online_store/blocs/order_bloc.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/helpers/paddings/padding_helper.dart';
import 'package:online_store/models/shoe.dart';
import 'package:online_store/ui/screens/detail_screen.dart';

import 'item_card.dart';

class DetailBody extends StatefulWidget {
  final Shoe shoe;
  const DetailBody({Key key, this.shoe}) : super(key: key);

  @override
  _DetailBodyState createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  DetailBloc detailBloc;
  OrderBloc orderBloc;
  @override
  void initState() {
    super.initState();
    detailBloc = DetailBloc.getInstance();
    orderBloc = OrderBloc.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 1 / 2,
            child: Image.asset(
              widget.shoe.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          color: ColorHelper.bgColor,
                          border: Border.all(width: 1, color: Colors.black),
                          shape: BoxShape.rectangle),
                      child: Center(
                        child: Text('41'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          shape: BoxShape.rectangle),
                      child: Center(
                        child: Text('42'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          shape: BoxShape.rectangle),
                      child: Center(
                        child: Text('43'),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.shoe.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    )),
                SizedBox(
                  height: 5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  RatingBar(
                    itemSize: 24,
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '(80 votes)',
                    style: TextStyle(color: Colors.blue),
                  )
                ]),
                SizedBox(
                  height: 5,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${widget.shoe.price}\$',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: ColorHelper.navBackgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.shoe.price}\$',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40,
                          height: 32,
                          child: OutlineButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => detailBloc.countItem('decrement'),
                            child: Icon(Icons.remove),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: StreamBuilder<int>(
                              stream: detailBloc.counterStream,
                              initialData: 1,
                              builder: (context, snapshot) {
                                orderBloc.counterChanged(snapshot.data);
                                return Text(snapshot.data.toString());
                              }),
                        ),
                        SizedBox(
                          width: 40,
                          height: 32,
                          child: OutlineButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => detailBloc.countItem('increment'),
                            child: Icon(Icons.add),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.shoe.description,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suggest for you',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    IconButton(icon: Icon(Icons.navigate_next), onPressed: null)
                  ],
                ),
                Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: shoes.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details(
                                          shoe: shoes[index],
                                        ))),
                            child: ItemCard(shoes[index]));
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    detailBloc.dispose();
    orderBloc.dispose();
    super.dispose();
  }
}
