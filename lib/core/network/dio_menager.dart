

import 'package:api_1/core/constansts/api_endpoint.dart';
import 'package:dio/dio.dart';

class DioMenager {
  static Dio dio = Dio();
   
  dio.options = BaseOptions(
      baseUrl = ApiEndpoint.baseUrl ;
      headers : {'Authorizantion' : Constants.apiKey}  
  )
}
