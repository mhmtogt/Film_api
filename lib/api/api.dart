import 'dart:convert';

import 'package:api_1/constants.dart';
import 'package:api_1/models/film.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _favoriteUrl =
      'https://api.collectapi.com/imdb/imdbSearchByName?query=inception?api_key=${Constants.apiKey}';

  Future<List<FilmModel>> getFavoriFilm() async {
    final response = await http.get(Uri.parse(_favoriteUrl));
    if (response.statusCode == 200) {
      final decodedData =
          jsonDecode(response.body)['results'] as List; //verilen mapi listeler
      return decodedData
          .map((filmodel) => FilmModel.EromJson(filmodel))
          .toList();
    } else {
      throw Exception('bir hata oluştu');
    } // internetten gelen veriye göre ok yada değil
  }
}
