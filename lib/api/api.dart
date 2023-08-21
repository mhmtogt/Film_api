import 'package:api_1/constants.dart';
import 'package:api_1/models/film.dart';
import 'package:dio/dio.dart';

class Api {
  static const _baseUrl = 'https://api.collectapi.com/';

  static const _favoriteUrl =
      '${_baseUrl}imdb/imdbSearchByName?query=inception';

  Future<List<FilmModel>> getFavoriFilm() async {
    try {
      final dio = Dio();
      dio.options.headers = {'Authorization': Constants.apiKey};
      final response = await dio.get(_favoriteUrl);
      final List<dynamic> data = response.data['result'];
      final List<FilmModel> films =
          data.map((item) => FilmModel.fromJson(item)).toList();
      return films;
    } on DioException catch (error) {
      throw Exception('Bir hata oluştu: $error');
    } // internetten gelen veriye göre ok yada değil
  }

  Future<void> postFilm(FilmModel film) async {
    try {
      final dio = Dio();
      dio.options.headers = {'Authorization': Constants.apiKey};

      // Örnek JSON veri
      final filmData = film.ImdbId;

      final response = await dio.post(_baseUrl + 'post', data: filmData);

      if (response.statusCode == 200) {
        print('Film oluşturuldu.');
      } else {
        print('POST  Hata kodu: ${response.statusCode}');
      }
    } on DioException catch (error) {
      throw Exception('Bir hata oluştu: $error');
    }
  }

  Future<void> putFilm(FilmModel film) async {
    try {
      final dio = Dio();
      dio.options.headers = {'Authorization': Constants.apiKey};

      // Örnek JSON veri
      final filmData = film.ImdbId;

      final response = await dio.put(_baseUrl + 'put', data: filmData);

      if (response.statusCode == 200) {
        print('Film  güncellendi.');
      } else {
        print('PUT Hata kodu: ${response.statusCode}');
      }
    } on DioException catch (error) {
      throw Exception('Bir hata oluştu: $error');
    }
  }

  Future<void> deleteFilm(int filmId) async {
    try {
      final dio = Dio();
      dio.options.headers = {'Authorization': Constants.apiKey};

      final response = await dio.delete(_baseUrl + 'your_delete/$filmId');

      if (response.statusCode == 200) {
        print('Film  silindi.');
      } else {
        print('DELETE Hata kodu: ${response.statusCode}');
      }
    } on DioException catch (error) {
      throw Exception('Bir hata oluştu: $error');
    }
  }
}




// GET methodu size bir istek karşılığında geriye veri dönderiyor
//POST  methodu siz karşıya veri gönderiyorsunuz 
// PUT methodu güncelleme işlemleri 
// DELETE methodu ise silme işlemleri için kullanılır