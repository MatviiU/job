import 'package:equatable/equatable.dart';
class NumberFact extends Equatable {
  const NumberFact({required this.number, required this.fact});

  final String number;
  final String fact;

  @override
  List<Object?> get props => [number, fact];
}
