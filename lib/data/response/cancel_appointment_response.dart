// Response class
class CancelAppointmentResponse {
  final String message;
  final int status;

  CancelAppointmentResponse({
    required this.message,
    required this.status,
  });

  factory CancelAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return CancelAppointmentResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}