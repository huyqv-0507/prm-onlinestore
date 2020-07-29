import 'dart:async';

import 'dart:core';

import 'package:online_store/models/cart_item.dart';
import 'package:rxdart/subjects.dart';

class OrderBloc {
  static OrderBloc orderBloc;
  static OrderBloc getInstance() {
    return orderBloc ?? (orderBloc = OrderBloc());
  }

  List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  int _totalPrice;
  int get totalPrice => _totalPrice;

  Stream<int> get counterChangedStream => _counterChanged.stream;
  var _counterChanged = BehaviorSubject<int>();

  Sink<CartItem> get additionSink => _additionController.sink;
  var _additionController = BehaviorSubject<CartItem>();

  Stream<int> get itemCountStream => _itemCountController.stream;
  var _itemCountController = BehaviorSubject<int>();

  Stream<int> get totalPriceStream => _totalPriceController.stream;
  var _totalPriceController = StreamController<int>();

  Stream<List<CartItem>> get cartItemStream => _cartItemStreamController.stream;
  var _cartItemStreamController = StreamController<List<CartItem>>();

  Sink<int> get removeSink => _removeCartController.sink;
  var _removeCartController = BehaviorSubject<int>();

  OrderBloc() {
    _additionController.stream.listen(_handleAdditionCart);
    _removeCartController.stream.listen(_handleRemoveCart);
  }

  void counterChanged(int count) {
    _counterChanged.sink.add(count);
  }

  void _handleAdditionCart(CartItem cartItem) {
    _cart.add(cartItem);
    _itemCountController.sink.add(_cart.length);
    _totalPriceController.sink.add(getTotalPrice());
    _cartItemStreamController.add(_cart);
  }

  void _handleRemoveCart(int index) {
    _cart.removeAt(index);
    _itemCountController.sink.add(_cart.length);
    _totalPriceController.sink.add(getTotalPrice());
    _cartItemStreamController.add(_cart);
  }

  void removeAllCart() {
    _cart.clear();
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (var i = 0; i < _cart.length; i++) {
      int price = _cart[i].countItem * _cart[i].shoe.price.round() * 23000;
      totalPrice += price;
    }
    _totalPrice = totalPrice;
    return _totalPrice;
  }

  void dispose() {
    _counterChanged.close();
    _itemCountController.close();
    _additionController.close();
    _totalPriceController.close();
    _cartItemStreamController.close();
    _removeCartController.close();
  }
}
