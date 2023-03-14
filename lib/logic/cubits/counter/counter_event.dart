part of 'counter_cubit.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class InitialCounterEvent extends CounterEvent {}

class InitiatedCounterEvent extends CounterEvent {}
