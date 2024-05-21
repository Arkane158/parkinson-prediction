// Response Model
class EditPatientResponse {
  final String message;
  final int status;

  EditPatientResponse({
    required this.message,
    required this.status,
  });

  factory EditPatientResponse.fromJson(Map<String, dynamic> json) {
    return EditPatientResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}