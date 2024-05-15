// LoginResponse
import 'package:parkinson_app/data/model/doctor.dart';

class SignInResponse {
  String message;
  int status;
  bool profileCheck;
  Doctor? doctor;

  SignInResponse({
    required this.message,
    required this.status,
    required this.profileCheck,
    this.doctor,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      message: json['message'],
      status: json['status'],
      profileCheck: json['Profilecheck'],
      doctor: json['data'] != null ? Doctor.fromJson(json['data']) : null,
    );
  }
}