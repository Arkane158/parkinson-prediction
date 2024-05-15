import 'dart:convert';

import 'package:parkinson_app/data/request/forgot_password_request.dart';
import 'package:parkinson_app/data/request/login_request.dart';
import 'package:parkinson_app/data/request/reset_password_request.dart';
import 'package:parkinson_app/data/request/sign_up_request.dart';
import 'package:parkinson_app/data/request/verification_request.dart';
import 'package:parkinson_app/data/request/verify_reset_password_request.dart';
import 'package:parkinson_app/data/response/forgot_password_response.dart';
import 'package:parkinson_app/data/response/reset_password_response.dart';
import 'package:parkinson_app/data/response/sign_in_response.dart';
import 'package:parkinson_app/data/response/sign_up_response.dart';
import 'package:http/http.dart' as http;
import 'package:parkinson_app/data/response/verification_respones.dart';
import 'package:parkinson_app/data/response/verify_reset_password_response.dart';

class ApiManager {
  static const String baseUrl = 'parkinson-9ek4.onrender.com';
  static const String signInUrl = '/login';
  static const String signUpUrl = '/signup';
  static const String verificationUrl = '/emailverification';
  static const String forgotPasswordUl = '/forget-password';
  static const String verifyResetPasswordUl = '/Verify-code';
  static const String resetPasswordUl = '/reset-password';
  static Future<SignUpResponse> signUpRequset(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    var requestBody = SignUpRequest(
        password: password, email: email, phone: phone, name: name);
    try {
      var url = Uri.https(baseUrl, signUpUrl);

      var response = await http.post(url, body: requestBody.toJson());
      return SignUpResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<VerificationResponse> verifyAccount(
      String code, String email) async {
    var requestBody = VerificationRequest(code: code, email: email);
    var url = Uri.https(baseUrl, verificationUrl);

    var response = await http.post(url, body: requestBody.toJson());
    return VerificationResponse.fromJson(jsonDecode(response.body));
  }

  static Future<SignInResponse> signIn(String email, String password) async {
    var requestBody = LoginRequest(password: password, email: email);
    var url = Uri.https(baseUrl, signInUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return SignInResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ForgotPasswordResponse> forgotPassword(String email) async {
    var requestBody = ForgotPasswordRequest(email: email);
    var url = Uri.https(baseUrl, forgotPasswordUl);
    var response = await http.post(url, body: requestBody.toJson());
    return ForgotPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<VerifyResetPasswordResponse> verifyResetPassword(
      String email, String code) async {
    var requestBody = VerifyResetPasswordRequest(email: email, code: code);
    var url = Uri.https(baseUrl, verifyResetPasswordUl);

    var response = await http.post(url, body: requestBody.toJson());
    return VerifyResetPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ResetPasswordResponse> resetPassword(
      String email, String password) async {
    var requestBody = ResetPasswordRequest(email: email, newPassword: password);
    var url = Uri.https(baseUrl, resetPasswordUl);
    var response = await http.post(url, body: requestBody.toJson());
    return ResetPasswordResponse.fromJson(jsonDecode(response.body));
  }
}
