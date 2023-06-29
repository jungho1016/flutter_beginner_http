import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _counter = 0;
  final _countingSubject = BehaviorSubject.seeded(0);

  void accounting() {
    _counter++;
    _countingSubject.add(_counter);
  }

  Stream<int> get count$ => _countingSubject.stream;
}
