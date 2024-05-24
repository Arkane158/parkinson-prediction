import 'package:parkinson_app/data/model/appointment.dart';

class AppointmentsResponse {
  final List<Appointment> result;

  AppointmentsResponse({required this.result});

  factory AppointmentsResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentsResponse(
      result: List<Appointment>.from(json['result']
          .map((appointment) => Appointment.fromJson(appointment))),
    );
  }
}
