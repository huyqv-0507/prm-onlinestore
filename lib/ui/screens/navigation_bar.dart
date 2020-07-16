import 'package:flutter/material.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/ui/screens/category_screen.dart';
import 'package:online_store/ui/screens/favorite_screen.dart';
import 'package:online_store/ui/screens/home_screen.dart';
import 'package:online_store/ui/screens/profile_screen.dart';

import 'cart_screen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedNavBar = 0;

  static final List _itemsNav = <Widget>[
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void _onItemNav(int index) {
    setState(() {
      _selectedNavBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _itemsNav.elementAt(_selectedNavBar),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: ColorHelper.navBackgroundColor),
        child: BottomNavigationBar(
            currentIndex: _selectedNavBar,
            selectedItemColor: ColorHelper.selectedItemNavColor,
            unselectedItemColor: ColorHelper.unSelectedItemNavColor,
            elevation: 5.0,
            onTap: _onItemNav,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), title: Text('Brand')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), title: Text('Cart')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), title: Text('Favorite')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Profile')),
            ]),
      ),
    );
  }
}
