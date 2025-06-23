import 'package:hive/hive.dart';
import 'package:number_facts/core/data/models/number_fact.dart';

class NumberFactAdapter extends TypeAdapter<NumberFact> {

  @override
  int get typeId => 0;


  @override
  NumberFact read(BinaryReader reader) {
    final numberOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numberOfFields; i++) reader.readByte(): reader.read(),
    };


    return NumberFact(number: fields[0] as String, fact: fields[1] as String);
  }


  @override
  void write(BinaryWriter writer, NumberFact obj) {

    writer.writeByte(2);

    writer.writeByte(0);
    writer.write(obj.number);

    writer.writeByte(1);
    writer.write(obj.fact);
  }
}
