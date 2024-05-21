class AddPatientResponse {
  final String message;
  final int status;

  AddPatientResponse({
    required this.message,
    required this.status,
  });

  factory AddPatientResponse.fromJson(Map<String, dynamic> json) {
    return AddPatientResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}
