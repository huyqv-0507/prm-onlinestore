import 'dart:async';

import 'package:rxdart/subjects.dart';

class DetailBloc {
  static DetailBloc detailBloc;
  static DetailBloc getInstance() {
    return detailBloc ?? (detailBloc = DetailBloc());
  }

  int _count = 1;

  Sink<int> get counterSink => _counter.sink;
  Stream<int> get counterStream => _counter.stream;
  var _counter = BehaviorSubject<int>();

  //increment and decrement quantity shoe
  countItem(String countStr) {
    switch (countStr) {
      case 'increment':
        {
          counterSink.add(_count += 1);
          break;
        }
      case 'decrement':
        {
          if (_count == 0) break;
          counterSink.add(_count -= 1);
          break;
        }
    }
  }

  void dispose() {
    _counter.close();
  }
}
