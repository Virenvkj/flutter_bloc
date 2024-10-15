class CounterStates {
  int counter;
  List<String>? test;
  CounterStates({required this.counter, this.test});
}

class InitialState extends CounterStates {
  InitialState() : super(counter: 0);
}
