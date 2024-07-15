import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.dart';

part 'counter_state.dart';

part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState.initial()) {
    on<CounterEvent>(
      (event, emit) async {
        if (event is _increment) {
          await _onIncrement(event, emit);
        } else if (event is _dicrement) {
          await _onDecrement(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _onIncrement(
    _increment event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      isLoading: false,
      count: state.count + 10,
    ));
  }

  Future<void> _onDecrement(
    _dicrement event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      isLoading: false,
      count: state.count - 10,
    ));
  }
}
