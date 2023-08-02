import 'dart:convert';

import 'package:e_commerce/features/model/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreUtils {
  static String _tokenkey = "token";
  static String _userKey = "token";

  static Future<void> saveToken(String token) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setString(_tokenkey, token);
  }

  static Future<String> getToken() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    final res = instance.getString(_tokenkey);
    return res ?? "";
  }

  static Future<void> removeToken() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.remove(_tokenkey);
  }

  static Future<void> saveUser(User user) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    final mapUser = user.toJson();
    final encodedUser = json.encode(mapUser);
    await instance.setString(_tokenkey, encodedUser);
  }

  static Future<User?> getUser() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    final res = instance.getString(_tokenkey);
    if (res?.isEmpty ?? true) {
      return null;
    }
    final decodedUser = Map<String, dynamic>.from(json.decode(res!));
    final user = User.fromJson(decodedUser);
    return user;
  }

  static Future<void> removeUser() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.remove(_userKey);
  }
}
