class DeletePatientResponse {
  final String message;
  final int status;

  DeletePatientResponse({
    required this.message,
    required this.status,
  });

  factory DeletePatientResponse.fromJson(Map<String, dynamic> json) {
    return DeletePatientResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}
