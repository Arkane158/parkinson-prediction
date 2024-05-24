class EditProfileRequest {
  final String userId;
  final String phone;
  final String name;
  final String address;
  final String workdays;
  final String startTime;
  final String endTime;
  final String step;

  EditProfileRequest({
    required this.userId,
    required this.phone,
    required this.name,
    required this.address,
    required this.workdays,
    required this.startTime,
    required this.endTime,
    required this.step,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'phone': phone,
      'Name': name,
      'address': address,
      'workdays': workdays,
      'startTime': startTime,
      'endTime': endTime,
      'step': step,
    };
  }
}