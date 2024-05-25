// Response Model
class EditProfileImageResponse {
  final String message;
  final String img;
  final int status;

  EditProfileImageResponse({
    required this.message,
    required this.img,
    required this.status,
  });

  factory EditProfileImageResponse.fromJson(Map<String, dynamic> json) {
    return EditProfileImageResponse(
      message: json['message'],
      img: json['link'],
      status: json['status'],
    );
  }
}