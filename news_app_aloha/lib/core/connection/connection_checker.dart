import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app_aloha/core/services/local/app_injector.dart';

class ConnectionChecker {
  static Future<bool> get isConnected =>
      AppInjector.instance<InternetConnectionChecker>().hasConnection;
}
