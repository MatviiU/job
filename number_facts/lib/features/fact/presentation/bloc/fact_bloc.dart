import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_facts/core/data/models/number_fact.dart';
import 'package:number_facts/core/data/repositories/number_fact_repository.dart';

part 'fact_event.dart';

part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc(this.repository) : super(FactInitial()) {
    on<GetFactForNumber>(_onGetFactForNumber);
    on<GetRandomFact>(_onGetRandomFact);
  }

  final NumberFactRepository repository;

  Future<void> _onGetFactForNumber(
    GetFactForNumber event,
    Emitter<FactState> emit,
  ) async {
    emit(FactLoading());
    try {
      final number = await repository.getFactForNumber(event.number);
      emit(FactLoaded(number));
    } catch (error) {
      emit(FactError(error.toString()));
    }
  }

  Future<void> _onGetRandomFact(
    GetRandomFact event,
    Emitter<FactState> emit,
  ) async {
    emit(FactLoading());
    try {
      final fact = await repository.getRandomFact();
      emit(FactLoaded(fact));
    } catch (error) {
      emit(FactError(error.toString()));
    }
  }
}
