import 'package:flutter/material.dart';
import 'package:online_store/blocs/order_bloc.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/models/cart_item.dart';
import 'package:online_store/models/shoe.dart';
import 'package:online_store/ui/components/detail_body.dart';
import 'package:online_store/ui/screens/shopping_cart.dart';

class Details extends StatefulWidget {
  final Shoe shoe;

  const Details({Key key, this.shoe}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  OrderBloc orderBloc;
  void addToCart(CartItem cartItem) {
    orderBloc.additionSink.add(CartItem(1, widget.shoe));
  }

  void shoppingCart() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShoppingCart(
                  cartItems: orderBloc.cart,
                )));
  }

  @override
  Widget build(BuildContext context) {
    orderBloc = OrderBloc.getInstance();
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
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.grey,
                    onPressed: shoppingCart),
                Positioned(
                    right: 3,
                    top: 3,
                    child: StreamBuilder<int>(
                        initialData: 0,
                        stream: orderBloc.itemCountStream,
                        builder: (context, snapshot) {
                          return snapshot.data != 0
                              ? Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red),
                                  child: Text(
                                    '${snapshot.data}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : Container();
                        }))
              ],
            )
          ],
        ),
        body: DetailBody(shoe: widget.shoe),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(5),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: RaisedButton(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () => addToCart(CartItem(1, widget.shoe)),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )))));
  }
}
