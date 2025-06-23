import 'package:http/http.dart' as http;
import 'dart:convert';

class NumbersRemoteDatasource {
  NumbersRemoteDatasource({required this.client});

  final http.Client client;
  final String _baseUrl = 'http://numbersapi.com';

  Future<String> getFactForNumber(String number) async {
    final response = await client.get(Uri.parse('$_baseUrl/$number'));
    if (response.statusCode == 200){
      return utf8.decode(response.bodyBytes); // utf8 для підтримки різних символів
    } else{
      throw Exception('Failed to load fact for number $number');
    }
  }

  Future<String> getRandomFact() async{
    final response = await client.get(Uri.parse('$_baseUrl/random/math'));
    if (response.statusCode == 200){
      return utf8.decode(response.bodyBytes); // utf8 для підтримки різних символів
    } else{
      throw Exception('Failed to load fact');
    }
  }
}
