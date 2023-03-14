import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  Future<void> countValue() async {
    final currentEvent = InitiatedCounterEvent();
    emit(state.copyWith(
      counter: state.counter + 1,
      counterEvent: currentEvent,
    ));
  }

  Future<void> resetCount() async {
    emit(CounterState.initial());
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    final counterState = CounterState.fromJson(json);
    return counterState;
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    final counterJson = state.toJson();
    return counterJson;
  }
}
