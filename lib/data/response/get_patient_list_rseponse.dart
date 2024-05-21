import 'package:parkinson_app/data/model/patient.dart';

class GetPatientListResponse {
  final List<Patient> result;
  final int status;

  GetPatientListResponse({
    required this.result,
    required this.status,
  });

  factory GetPatientListResponse.fromJson(Map<String, dynamic> json) {
    return GetPatientListResponse(
      result: (json['result'] as List).map((i) => Patient.fromJson(i)).toList(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result.map((patient) => patient.toJson()).toList(),
      'status': status,
    };
  }
}
