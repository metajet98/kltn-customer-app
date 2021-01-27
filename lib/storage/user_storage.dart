import 'package:customer_app/storage/storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class UserStorage extends Storage<int> {
  UserStorage(SharedPreferences prefs) : super(prefs, 'user_id');

  @override
  int get({int defaultValue}) {
    return prefs.getInt(key) ?? defaultValue;
  }

  @override
  void set(int value) {
    prefs.setInt(key, value);
  }
}
