part of 'fact_bloc.dart';

abstract class FactEvent extends Equatable{
  const FactEvent();

  @override
  List<Object?> get props => [];
}

class GetFactForNumber extends FactEvent {
  const GetFactForNumber(this.number);

  final String number;

  @override
  List<Object?> get props => [number];
}

class GetRandomFact extends FactEvent {}