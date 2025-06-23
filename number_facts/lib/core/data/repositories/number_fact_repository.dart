import 'package:number_facts/core/data/data_source/history_local_datasource.dart';
import 'package:number_facts/core/data/data_source/numbers_remote_datasource.dart';
import 'package:number_facts/core/data/models/number_fact.dart';

class NumberFactRepository{
  NumberFactRepository({required this.remoteDatasource, required this.localDatasource});

  final NumbersRemoteDatasource remoteDatasource;
  final NumbersLocalDatasource localDatasource;

  Future<NumberFact> getFactForNumber(String number) async{
    final factText = await remoteDatasource.getFactForNumber(number);
    final numberFact = NumberFact(number: number, fact: factText);

    await localDatasource.saveFact(numberFact);
    return numberFact;
  }
  
  Future<NumberFact> getRandomFact() async{
    final factText = await remoteDatasource.getRandomFact();
    final number = factText.split(' ').first;
    final numberFact = NumberFact(number: number, fact: factText);

    await localDatasource.saveFact(numberFact);
    return numberFact;
  }

  Future<List<NumberFact>> getHistory() async{
    return await localDatasource.getHistory();
  }

}