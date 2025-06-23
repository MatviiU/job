part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  const HistoryLoaded(this.facts);

  final List<NumberFact> facts;

  @override
  List<Object?> get props => [facts];
}

class HistoryError extends HistoryState {
  const HistoryError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
