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

  Stream<int> get counterChangedStream => _counterChanged.stream;
  var _counterChanged = BehaviorSubject<int>();

  Sink<CartItem> get additionSink => _additionController.sink;
  var _additionController = StreamController<CartItem>();

  Stream<int> get itemCountStream => _itemCountController.stream;
  var _itemCountController = BehaviorSubject<int>();

  Stream<int> get totalPriceStream => _totalPriceController.stream;
  var _totalPriceController = BehaviorSubject<int>();

  Stream<List<CartItem>> get cartItemStream => _cartItemStreamController.stream;
  var _cartItemStreamController = BehaviorSubject<List<CartItem>>();

  OrderBloc() {
    _additionController.stream.listen(_handleCart);
  }

  void counterChanged(int count) {
    _counterChanged.sink.add(count);
    print('$count ........');
  }

  void _handleCart(CartItem cartItem) {
    _cart.add(cartItem);
    _itemCountController.sink.add(_cart.length);
    _totalPriceController.sink
        .add(_totalPrice(cartItem.countItem, cartItem.shoe.price));
    _cartItemStreamController.add(_cart);
    print('###### ${cartItem.countItem}');
    print('.......... $cartItem');
    print('--------- $totalPriceStream');
  }

  int _totalPrice(int count, double price) {
    return (count * price).round();
  }

  void dispose() {
    _counterChanged.close();
    _itemCountController.close();
    _additionController.close();
    _totalPriceController.close();
    _cartItemStreamController.close();
  }
}
