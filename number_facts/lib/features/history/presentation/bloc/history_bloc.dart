import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_facts/core/data/models/number_fact.dart';
import 'package:number_facts/core/data/repositories/number_fact_repository.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(this.repository) : super(HistoryInitial()) {
    on<LoadHistory>(_onLoadHistory);
  }

  final NumberFactRepository repository;

  Future<void> _onLoadHistory(
    LoadHistory event,
    Emitter<HistoryState> emit,
  ) async {
    emit(HistoryLoading());
    try {
      final facts = await repository.getHistory();

      emit(HistoryLoaded(facts));
    } catch (error) {
      emit(HistoryError(error.toString()));
    }
  }
}
