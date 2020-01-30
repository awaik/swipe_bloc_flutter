import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwipesBloc {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  int _counter;

  SwipesBloc() {
    prefs.then((val) {
      if (val.get('count') != null) {
        _counter = val.getInt('count') ?? 1;
      } else {
        _counter = 1;
      }
      _actionController.stream.listen(_changeStream);
      _addValue.add(_counter);
    });
  }

  final _counterStream = BehaviorSubject<int>.seeded(1);
  Stream get pressedCount => _counterStream.stream;
  Sink get _addValue => _counterStream.sink;

  StreamController _actionController = StreamController();
  void get resetCount => _actionController.sink.add(null);
  StreamSink get incrementCounter => _actionController.sink;

  void _changeStream(data) async {
    if (data == null) {
      _counter = 1;
    } else {
      _counter = _counter + data;
    }
    _addValue.add(_counter);
    prefs.then((val) {
      val.setInt('count', _counter);
    });
  }

  void dispose() {
    _counterStream.close();
    _actionController.close();
  }
}
