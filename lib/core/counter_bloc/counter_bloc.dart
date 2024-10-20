import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_ex/core/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_ex/core/counter_bloc/counter_state.dart';

class CounterBlocs extends Bloc<CounterEvents, CounterStates>{
  CounterBlocs():super(InitialState()){
    on<Increment>((event, emit){
      emit(CounterStates(counter: state.counter+1));
    });

    on<Decrement>((event, emit){
      emit(CounterStates(counter:state.counter-1));
    });
  }
}