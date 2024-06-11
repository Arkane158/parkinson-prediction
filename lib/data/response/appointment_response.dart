import 'package:parkinson_app/data/model/appointment.dart';

class AppointmentsResponse {
  final List<AppointmentResult> result;

  AppointmentsResponse({required this.result});

  factory AppointmentsResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentsResponse(
      result: List<AppointmentResult>.from(json['result']
          .map((appointment) => AppointmentResult.fromJson(appointment))),
    );
  }
}
