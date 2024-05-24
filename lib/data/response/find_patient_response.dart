import 'package:parkinson_app/data/model/patient.dart';

class FindPatientResponse {
  final List<Patient> result;
  final int status;
  final String? message;

  FindPatientResponse({
    required this.result,
    required this.status,
    this.message,
  });

  factory FindPatientResponse.fromJson(Map<String, dynamic> json) {
    return FindPatientResponse(
      result: List<Patient>.from(json['result'].map((x) => Patient.fromJson(x))),
      status: json['status'] ?? 0,
      message: json['message'],
    );
  }
}