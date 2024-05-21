import 'dart:io';

class DoctorDataCollectionRequest {
  final String? name;
  final String ?address;
  final String ?phone;
  final String ?startTime;
  final String ?endTime;
  final String ?step;
  final String ?workdays;
  final File ?image;

  DoctorDataCollectionRequest({
    required this.name,
    required this.address,
    required this.phone,
    required this.startTime,
    required this.endTime,
    required this.step,
    required this.workdays,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'startTime': startTime,
      'endTime': endTime,
      'step': step,
      'workdays': workdays,
      'image': image,
    };
  }
}
