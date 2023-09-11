import 'package:api_1/core/constansts/api_endpoint.dart';
import 'package:api_1/core/constansts/api_setting_constants.dart';
import 'package:dio/dio.dart';

class DioManager {
  static Dio dio = Dio();
   
  DioManager() {
    dio.options = BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      headers: {'Authorization': ApiSettingsConstants.apiKey},
    );
  }
}


