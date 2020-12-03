import 'package:customer_app/configs/backend_config.dart';
import 'package:customer_app/fcm/fcm_manager.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/logger.dart';
import 'package:customer_app/storage/auth_storage.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:synchronized/synchronized.dart' as synchronized;

@lazySingleton
class AuthManager {
  final _dio = Dio();

  Future<AuthToken> login(String phoneNumber, String password) async {
    logger.d("Logging in - phone $phoneNumber, password $password");

    final response = await _dio.post("${BackendConfig.BASE_URL}/api/login");
    final authToken = AuthToken("accessToken", "refreshToken", DateTime.now());
    locator<AuthStorage>().set(authToken);
    await locator<FcmManager>().registerToken();

    logger.d("Logged in - credentials ${authToken.toJson()}");

    return authToken;
  }

  Future<AuthToken> _refresh({AuthToken authToken}) async {
    authToken ??= locator<AuthStorage>().get();

    logger.d("Refreshing - credentials ${authToken?.toJson()}");

    if (authToken == null) {
      throw StateError("Auth Token must be not null");
    }

    final response = await _dio.post("${BackendConfig.BASE_URL}/api/token/refresh");
    final newToken = AuthToken("accessToken", "refreshToken", DateTime.now());
    locator<AuthStorage>().set(newToken);

    logger.d("Refreshed - credentials ${newToken.toJson()}");

    return newToken;
  }

  Future<void> logout() async {
    logger.d("Logging out");

    await locator<FcmManager>().unregisterToken();
    await locator<SharedPreferences>().clear();

    logger.d("Logged out");
  }

  bool isLoggedIn() {
    final AuthToken token = locator<AuthStorage>().get();
    return token != null && !token.isExpired;
  }

  Future<String> getAccessToken() async {
    AuthToken token = locator<AuthStorage>().get();

    if (token == null) {
      return null;
    }

    if (token.isExpired) {
      await synchronized.Lock().synchronized(() async {
        if(token.isExpired) {
          token = await _refresh(authToken: token);
        }
      });
      // ignore: invariant_booleans
      if (token == null) {
        return null;
      }
    }

    return token.accessToken;
  }
}
