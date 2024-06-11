class EditProfileRequest {
  final String userId;
  final String phone;
  final String name;
  final String address;
  final String workdays;
  final String startTime;
  final String endTime;
  final String title;
  final String about;
  final String step;
  final String whatsapp;

  EditProfileRequest(
      {required this.userId,
      required this.phone,
      required this.name,
      required this.address,
      required this.workdays,
      required this.startTime,
      required this.endTime,
      required this.step,
      required this.title,
      required this.whatsapp,
      required this.about});

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
      'title': title,
      'about': about,
      'whatsapp': whatsapp,
    };
  }
}
