import 'package:flutter/material.dart';
import 'package:online_store/blocs/order_bloc.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/ui/screens/shopping_cart.dart';
import 'package:online_store/ui/tabs/adidas_tab.dart';
import 'package:online_store/ui/tabs/all_tab.dart';
import 'package:online_store/ui/tabs/bitis_tab.dart';
import 'package:online_store/ui/tabs/nike_tab.dart';
import 'package:online_store/ui/tabs/puma_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreneState createState() => _HomeScreneState();
}

class _HomeScreneState extends State<HomeScreen> {
  final List categoriesTab = <Widget>[
    Tab(text: 'All'),
    Tab(text: 'Adidas'),
    Tab(text: 'Nike'),
    Tab(text: 'Puma'),
    Tab(text: 'Bitis'),
  ];
  OrderBloc orderBloc;
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
    return DefaultTabController(
      length: categoriesTab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Online store',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: ColorHelper.bgColor,
          bottom: TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontSize: 16,
            ),
            tabs: categoriesTab,
            indicatorColor: Colors.black,
            indicatorWeight: 2,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search), color: Colors.black, onPressed: null),
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
        body: TabBarView(children: <Widget>[
          AllTab(),
          AdidasTab(),
          NikeTab(),
          PumaTab(),
          BitisTab(),
        ]),
      ),
    );
  }
}
