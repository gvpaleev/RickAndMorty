import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_model.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPerson(int page);
  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final Dio client;

  PersonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PersonModel>> getAllPerson(int page) async {
    final String url = 'https://rickandmortyapi.com/api/character/?page=$page';
    return _getPersonFromUrl(url);
  }

  @override
  Future<List<PersonModel>> searchPerson(String query) async {
    final String url = 'https://rickandmortyapi.com/api/character/?name=$query';

    return _getPersonFromUrl(url);
  }

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    print(url);
    final respons = await client.get(url);
    if (respons.statusCode == 200) {
      final person = respons.data;
      return (person['results'] as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
