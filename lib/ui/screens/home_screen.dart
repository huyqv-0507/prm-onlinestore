import 'package:flutter/material.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
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
  @override
  Widget build(BuildContext context) {
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
            IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.black,
                onPressed: null)
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
