part of 'fact_bloc.dart';

abstract class FactState extends Equatable{
  const FactState();

  @override
  List<Object?> get props => [];
}

class FactInitial extends FactState{}

class FactLoading extends FactState{}

class FactLoaded extends FactState {
  const FactLoaded(this.fact);

  final NumberFact fact;

  @override
  List<Object?> get props => [fact];
}

class FactError extends FactState {
  const FactError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}