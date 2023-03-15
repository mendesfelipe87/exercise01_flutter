part of 'counter_cubit.dart';

class CounterState {
  final int counter;
  final String event;

  const CounterState({required this.counter, required this.event});

  factory CounterState.initial() {
    return CounterState(counter: 0, event: "InitialCounterEvent");
  }

  CounterState copyWith({int? counter, String? counterEvent}) {
    return CounterState(
        counter: counter ?? this.counter, event: counterEvent ?? event);
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'counter': counter, 'event': event});

    return result;
  }

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
        counter: json['counter']?.toInt() ?? 0,
        event: json['event']?.toString() ?? "InitialCounterEvent");
  }
}
