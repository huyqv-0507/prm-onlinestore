import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_store/blocs/order_bloc.dart';
import 'package:online_store/blocs/payment_bloc.dart';
import 'package:online_store/data/repositories/payment_repository.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/helpers/paddings/padding_helper.dart';
import 'package:online_store/models/cart_item.dart';
import 'package:online_store/models/order_info.dart';
import 'package:online_store/models/shoe.dart';
import 'package:online_store/ui/screens/webview_payment.dart';

class ShoppingCart extends StatefulWidget {
  final List<CartItem> cartItems;

  const ShoppingCart({Key key, this.cartItems}) : super(key: key);
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  PaymentRepository paymentRepository = PaymentRepository();

  OrderBloc orderBloc;
  PaymentBloc paymentBloc;
  OrderInfo orderInfo;
  int randomTxnRef() {
    Random random = Random();
    return random.nextInt(10000);
  }

  void removeItem(int index) {
    orderBloc.removeSink.add(index);
  }

  @override
  Widget build(BuildContext context) {
    orderBloc = OrderBloc.getInstance();
    paymentBloc = PaymentBloc.getInstance();

    orderInfo =
        OrderInfo(randomTxnRef().toDouble(), orderBloc.totalPrice, 1, '00');
    paymentBloc.paymentSink.add(orderInfo);

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
            'Shopping cart',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Container(
            margin: EdgeInsets.only(top: defaultPadding),
            child: StreamBuilder<List<CartItem>>(
                stream: orderBloc.cartItemStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: shoeCard(widget.cartItems[index].shoe,
                                widget.cartItems[index].countItem, index),
                          );
                        });
                  } else {
                    return Center(
                      child: Text('Empty'),
                    );
                  }
                }),
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
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VNPayWebView(
                                  url: paymentBloc.paymentUrl,
                                ))),
                    child: Text(
                      'VNPay payment',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )))));
  }

  Container shoeCard(Shoe shoe, int count, int index) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: ColorHelper.bgItemColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 4, spreadRadius: .3, color: Colors.grey),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Image.asset(shoe.image),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${shoe.title}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Quantity: $count')
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: IconButton(
                  icon: Icon(MdiIcons.trashCan),
                  onPressed: () => removeItem(index)),
            ),
          )
        ],
      ),
    );
  }
}
