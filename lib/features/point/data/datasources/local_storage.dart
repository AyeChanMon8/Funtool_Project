import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage{
  Future<void> setString({required String string, required String key});
  Future<String> gettString({required String key, required String defaultString});
}

class LocalStorageImpl implements LocalStorage{
  final SharedPreferences sharedPreferences;
  LocalStorageImpl({required this.sharedPreferences});


  @override
  Future<void> setString({required String string, required String key}) async {
    await sharedPreferences.setString(key, string);
  }

  @override
  Future<String> gettString({required String key, required String defaultString}) async{
    return sharedPreferences.getString(key) ?? defaultString;
  }

}