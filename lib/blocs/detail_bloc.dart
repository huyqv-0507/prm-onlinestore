import 'dart:async';

import 'package:rxdart/subjects.dart';

class DetailBloc {
  int _count = 0;

  Stream<int> get counterStream => _counter.stream;
  final _counter = BehaviorSubject<int>();

  //increment and decrement quantity shoe
  countItem(String count) {
    switch (count) {
      case 'increment':
        {
          _counter.sink.add(_count += 1);
          break;
        }
      case 'decrement':
        {
          if (_count == 0) break;
          _counter.sink.add(_count -= 1);
          break;
        }
    }
  }

  void dispose() {
    _counter.close();
  }
}
