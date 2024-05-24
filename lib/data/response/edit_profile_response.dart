class EditProfileResponse {
  final String message;
  final int status;

  EditProfileResponse({
    required this.message,
    required this.status,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return EditProfileResponse(
      message: json['message'],
      status: json['status'] ?? 0,
    );
  }
}