import 'dart:convert';

import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../models/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'exception/internet_exception.dart';

abstract class BaseTMDBService {
  Future<FilmCollection> getFilms({required int page});
}

class TMDBService implements BaseTMDBService {
  final Client client;
  final InternetConnectionChecker connectionChecker;
  const TMDBService({
    required this.client,
    required this.connectionChecker,
  });
  static final _apiKey = dotenv.env['API_KEY']!;
  static const _baseUrl = 'https://api.themoviedb.org/3';
  static const _headers = {
    "Accept": "application/json",
    "content-type": "application/json"
  };

  @override
  Future<FilmCollection> getFilms({required int page}) async {
    if (!await connectionChecker.hasConnection) {
      throw InternetException(message: 'No internet connection.');
    }
    final url = Uri.parse(
      '$_baseUrl/movie/popular?api_key=$_apiKey&page=$page',
    );
    final response = await client.get(url, headers: _headers);

    if (response.statusCode == 200) {
      return FilmCollection.fromJson(json.decode(response.body));
    }
    throw InternetException(message: 'Failed to load data.');
  }
}
