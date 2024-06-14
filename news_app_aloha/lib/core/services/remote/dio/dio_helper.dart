import 'package:dio/dio.dart';
import 'package:news_app_aloha/core/services/remote/dio/dio_constants.dart';

abstract class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
      contentType: DioConstants.contentType,
      connectTimeout: const Duration(seconds: 15),
    ));
  }

  static Dio get getNewsClient {
    dio.options.baseUrl = DioConstants.newBaseUrl;
    return dio;
  }
}
