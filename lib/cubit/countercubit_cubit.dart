import 'package:bloc/bloc.dart';

part 'countercubit_state.dart';

class CountercubitCubit extends Cubit<CounterState> {
  CountercubitCubit() : super(CounterState(counterValue: 0));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
  void increment() => emit(CounterState(counterValue: state.counterValue + 1));
}
