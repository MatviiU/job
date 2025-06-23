import 'package:hive/hive.dart';
import 'package:number_facts/core/data/models/number_fact.dart';

class NumbersLocalDatasource{
  static const String _boxName = 'numberFacts';

  Future<List<NumberFact>> getHistory() async{
    final box = await Hive.openBox<NumberFact>(_boxName);
    return box.values.toList().reversed.toList();
  }

  Future<void> saveFact(NumberFact fact) async{
    final box = await Hive.openBox<NumberFact>(_boxName);
    await box.put('${fact.number}-${fact.fact.hashCode}', fact);
  }
}