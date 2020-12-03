import 'dart:convert';

import 'package:customer_app/storage/storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AuthStorage extends Storage<AuthToken> {
  AuthStorage(SharedPreferences prefs) : super(prefs, 'auth_token');

  @override
  AuthToken get({AuthToken defaultValue}) {
    final String json = prefs.getString(key);
    return json != null ? AuthToken.fromJson(json) : defaultValue;
  }

  @override
  void set(AuthToken value) {
    prefs.setString(key, value.toJson());
  }
}

class AuthToken {
  final String accessToken;
  final String refreshToken;
  final DateTime expiredIn;

  AuthToken(this.accessToken, this.refreshToken, this.expiredIn);

  String toJson() => jsonEncode(this);
  static AuthToken fromJson(String json) {
    final raw = jsonDecode(json) as Map<String, dynamic>;
    return AuthToken(raw["accessToken"], raw["refreshToken"], raw["expiredIn"]);
  }

  bool get isExpired => expiredIn?.isAfter(DateTime.now()) == true;
}