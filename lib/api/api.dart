import 'package:api_1/constants.dart';
import 'package:api_1/models/film.dart';
import 'package:dio/dio.dart';

class Api {
  static final Dio dio = Dio(BaseOptions(headers: {'Authorization': Constants.apiKey}));
  static const String _baseUrl = 'https://api.collectapi.com/';
  static const String _favoriteUrl = '${_baseUrl}imdb/imdbSearchByName?query=inception';

  // ignore: slash_for_doc_comments
  /**
   * static const String _baseUrl = 'https://api.collectapi.com/';
     static const String _imdbService = 'imdb/';
     static const String _imdbSearchByName = 'imdbSearchByName';
     static const String _queryParameter = '?query=inception';
   */

  Future<List<FilmModel>> getFavoriFilm() async {
    try {
     
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
     

      
      final filmData = film.imdbId;

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
 
   
      final filmData = film.imdbId;

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
    

      final response = await dio.delete(_baseUrl + 'delete/$filmId');

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