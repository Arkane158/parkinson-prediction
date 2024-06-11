class CancelAppointmentRequest {
  final String reservationId;
  final String appointmentId;
  final String timeOfDay;

  CancelAppointmentRequest(
      {required this.reservationId,
      required this.appointmentId,
      required this.timeOfDay});

  Map<String, dynamic> toJson() {
    return {
      'reservationId': reservationId,
      'appointmentId': appointmentId,
      'TimeOfDay': timeOfDay
    };
  }
}
