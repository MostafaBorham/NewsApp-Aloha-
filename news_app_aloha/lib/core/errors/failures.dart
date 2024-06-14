import 'package:news_app_aloha/core/errors/errors.dart';

class Failure {
  final String? message;

  Failure({this.message});
}

class ServerFailure extends Failure {
  ServerFailure() : super(message: AppErrors.serverErrorMessage);
}

class OfflineFailure extends Failure {
  OfflineFailure() : super(message: AppErrors.offlineErrorMessage);
}

class CacheFailure extends Failure {
  CacheFailure() : super(message: AppErrors.offlineErrorMessage);
}