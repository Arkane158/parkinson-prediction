import 'package:shared_preferences/shared_preferences.dart';

class DoctorPreference {
  static const String _keyId = 'id';
  static const String _keyEmail = 'email';
  static const String _keyPhone = 'phone';
  static const String _keyName = 'name';
  static const String _keyImg = 'img';
  static const String _keyAddress = 'address';
  static const String _keyWorkdays = 'workdays';
  static const String _keyStartTime = 'startTime';
  static const String _keyEndTime = 'endTime';
  static const String _keyStep = 'step';
  static const String _editUserProfileId = 'editProfileId';

  static Future<void> saveUserData({
    required String email,
    required String phone,
    required String name,
    required String address,
    required String workdays,
    required String startTime,
    required String endTime,
    required String step,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPhone, phone);
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyAddress, address);
    await prefs.setString(_keyWorkdays, workdays);
    await prefs.setString(_keyStartTime, startTime);
    await prefs.setString(_keyEndTime, endTime);
    await prefs.setString(_keyStep, step);
  }

  static Future<void> saveUserImg({required String img}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyImg, img);
  }

  static Future<String?> getUserImg() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? img = prefs.getString(_keyImg);
    return img;
  }

  static Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString(_keyName);
    return name;
  }

  static Future<void> saveUserId({
    required String id,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyId, id);
  }

  static Future<void> saveUserEmail({
    required String email,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
  }

  static Future<String?> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString(_keyEmail);
    return email;
  }

  static Future<void> saveEditProfileId({
    required String editUserProfileId,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_editUserProfileId, editUserProfileId);
  }

  static Future<String?> getuserEditProfileId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_editUserProfileId);
  }

  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyId);
  }

  static Future<void> clearUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyId);
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyPhone);
    await prefs.remove(_keyName);
    await prefs.remove(_keyImg);
    await prefs.remove(_keyAddress);
    await prefs.remove(_keyWorkdays);
    await prefs.remove(_keyStartTime);
    await prefs.remove(_keyEndTime);
    await prefs.remove(_keyStep);
  }
}
