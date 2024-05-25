// Request Model
import 'dart:io';

class EditProfileImageRequest {
  final File image;
  final String userId;

  EditProfileImageRequest({
    required this.image,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      '_id': userId,
    };
  }
}