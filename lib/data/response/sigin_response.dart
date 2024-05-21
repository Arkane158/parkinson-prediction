// LoginResponse
import 'package:parkinson_app/data/model/doctor.dart';

class SignInResponse {
  String message;
  int status;
  bool profileCheck;
  String userId;
  Doctor? doctor;

  SignInResponse({
    required this.message,
    required this.status,
    required this.profileCheck,
    required this.userId,
    this.doctor,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      message: json['message'],
      status: json['status'],
      profileCheck: json['Profilecheck'],
      userId: json['userId'],
      doctor: json['data'] != null ? Doctor.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'Profilecheck': profileCheck,
      'userId': userId,
      'data': doctor?.toJson(),
    };
  }
}
