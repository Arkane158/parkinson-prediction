class DoctorDataCollectionResponse {
  final String message;
  final int status;
  final String img;
  final String editProfileId;

  DoctorDataCollectionResponse({
    required this.message,
    required this.status,
    required this.img,
    required this.editProfileId,
  });

  factory DoctorDataCollectionResponse.fromJson(Map<String, dynamic> json) {
    return DoctorDataCollectionResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      img: json['img'] ?? '',
      editProfileId:
          json['_id'] ?? '', // Add this line to parse the editProfileId field
    );
  }
}
