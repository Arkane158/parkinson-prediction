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
  static const String _profileId = '_id';
  static const String _keyTitle = 'title';
  static const String _keyAbout = 'about';
  static const String _keyWhatsapp = 'whatsapp';

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
    return prefs.getString(_keyImg);
  }

  static Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }

  static Future<void> saveUserId({required String id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyId, id);
  }

  static Future<void> saveUserEmail({required String email}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
  }

  static Future<String?> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  static Future<void> saveEditProfileId({required String editUserProfileId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_editUserProfileId, editUserProfileId);
  }

  static Future<String?> getUserEditProfileId() async {
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
    await prefs.remove(_keyTitle);
    await prefs.remove(_keyAbout);
    await prefs.remove(_keyWhatsapp);
  }

  // New methods for title and about

  static Future<void> saveUserTitle({required String title}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyTitle, title);
  }

  static Future<String?> getUserTitle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyTitle);
  }

  static Future<void> saveUserAbout({required String about}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAbout, about);
  }

  static Future<String?> getUserAbout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAbout);
  }

  // New methods for whatsapp

  static Future<void> saveUserWhatsapp({required String whatsapp}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyWhatsapp, whatsapp);
  }

  static Future<String?> getUserWhatsapp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyWhatsapp);
  }

  // Existing methods for phone, workdays, start time, and end time

  static Future<void> saveUserPhone({required String phone}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPhone, phone);
  }

  static Future<String?> getUserPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPhone);
  }

  static Future<void> saveUserWorkdays({required String workdays}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyWorkdays, workdays);
  }

  static Future<String?> getUserWorkdays() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyWorkdays);
  }

  static Future<void> saveUserStartTime({required String startTime}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyStartTime, startTime);
  }

  static Future<String?> getUserStartTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyStartTime);
  }

  static Future<void> saveUserEndTime({required String endTime}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEndTime, endTime);
  }

  static Future<String?> getUserEndTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEndTime);
  }

  static Future<void> saveUserAddress({required String address}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAddress, address);
  }

  static Future<String?> getUserAddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAddress);
  }

  static Future<void> saveUserStep({required String step}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyStep, step);
  }

  static Future<String?> getUserStep() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyStep);
  }

  static Future<void> saveUserName({required String name}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
  }

  static Future<String?> getProfileId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_profileId);
  }

  static Future<void> saveProfileId({required String profileId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileId, profileId);
  }
}
