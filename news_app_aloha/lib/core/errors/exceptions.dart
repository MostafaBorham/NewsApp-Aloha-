import 'package:news_app_aloha/core/errors/errors.dart';

class ServerException implements Exception{
  @override
  String toString() {
    return AppErrors.serverErrorMessage;
  }
}

class NetworkException implements Exception{
  @override
  String toString() {
    return AppErrors.offlineErrorMessage;
  }
}

class CacheException implements Exception{
  @override
  String toString() {
    return AppErrors.cacheErrorMessage;
  }
}