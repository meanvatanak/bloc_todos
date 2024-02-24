import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final prefs = SharedPreferences.getInstance();

  static Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(key, value.toString());
      return true;
    } catch (e) {
      return false;
    }
  }

// static final LocalStorageService _instance =
//     LocalStorageService._internalConstructor();
//
// factory LocalStorageService() {
//   return _instance;
// }
//
// LocalStorageService._internalConstructor();
//
// static const String _tokenKey = 'token';
// static const String _userKey = 'user';
//
// Future<void> saveToken(String token) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString(_tokenKey, token);
// }
//
// Future<String?> getToken() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString(_tokenKey);
// }
//
// Future<void> saveUser(User user) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString(_userKey, jsonEncode(user.toJson()));
// }
//
// Future<User?> getUser() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? userJson = prefs.getString(_userKey);
//   if (userJson == null) {
//     return null;
//   }
//   return User.fromJson(jsonDecode(userJson));
// }
//
// Future<void> clear() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.clear();
// }
}
