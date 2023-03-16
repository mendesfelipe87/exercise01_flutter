part of 'counter_cubit.dart';

/// The state of the counter of the page.
/// Persist the state available.
class CounterState {
  final int counter;
  final String event;

  const CounterState({required this.counter, required this.event});

  factory CounterState.initial() {
    return CounterState(counter: 0, event: "InitialCounterEvent");
  }

  /// Send back the state of the counter updated with a new [counter] and new [counterEvent].
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
