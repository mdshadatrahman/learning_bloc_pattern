import 'dart:async';

class CounterBloc {
  int counter = 0;
  final _stateStreamCounter = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamCounter.sink;
  Stream<int> get counterStream => _stateStreamCounter.stream;

  final _eventStreamCounter = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamCounter.sink;
  Stream<CounterAction> get eventStream => _eventStreamCounter.stream;

  CounterBloc() {
    eventStream.listen((event) {
      switch (event) {
        case CounterAction.increment:
          counter++;
          break;
        case CounterAction.decrement:
          counter--;
          break;
        case CounterAction.reset:
          counter = 0;
          break;
      }
      counterSink.add(counter);
    });
  }
}

enum CounterAction {
  increment,
  decrement,
  reset,
}
