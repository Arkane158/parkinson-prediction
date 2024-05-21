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
    return prefs.getString(_keyEmail);
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

  static Future<void> saveUserImg({
    required String img,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyImg, img);
  }

  static Future<String?> getUserImg() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyImg);
  }

  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyId);
  }

  static Future<Map<String, String?>> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      _keyId: prefs.getString(_keyId),
      _keyEmail: prefs.getString(_keyEmail),
      _keyPhone: prefs.getString(_keyPhone),
      _keyName: prefs.getString(_keyName),
      _keyImg: prefs.getString(_keyImg),
      _keyAddress: prefs.getString(_keyAddress),
      _keyWorkdays: prefs.getString(_keyWorkdays),
      _keyStartTime: prefs.getString(_keyStartTime),
      _keyEndTime: prefs.getString(_keyEndTime),
      _keyStep: prefs.getString(_keyStep),
    };
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
