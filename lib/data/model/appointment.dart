class AppointmentResult {
  final String id;
  final String doctorId;
  final String patientId;
  final String appointmentId; // New field added
  final String dayOfWeek;
  final String dayOfMonth;
  final String timeOfDay; // already a string
  final String month;
  final String year;
  final String doctorName;
  final String patientName;
  final String appointmentStatus; // already a string
  final String img;
  final String doctorImg;

  AppointmentResult({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.appointmentId, // Initialize new field
    required this.dayOfWeek,
    required this.dayOfMonth,
    required this.timeOfDay,
    required this.month,
    required this.year,
    required this.doctorName,
    required this.patientName,
    required this.appointmentStatus,
    required this.img,
    required this.doctorImg,
  });

  factory AppointmentResult.fromJson(Map<String, dynamic> json) {
    return AppointmentResult(
      id: json['_id'] ?? '',
      doctorId: json['doctorId'] ?? '',
      patientId: json['patientId'] ?? '',
      appointmentId: json['appointmentId'] ?? '', 
      dayOfWeek: json['dayOfWeek'] ?? '',
      dayOfMonth: json['dayOfMonth'] ?? '',
      timeOfDay: json['TimeOfDay'] ?? '',
      month: json['month'] ?? '',
      year: json['Year'] ?? '',
      doctorName: json['doctorName'] ?? '',
      patientName: json['patientName'] ?? '',
      appointmentStatus: json['appointmentStatus'] ??
          '', // Ensure appointmentStatus is a string
      img: json['img'] ?? '',
      doctorImg: json['doctorimg'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'doctorId': doctorId,
      'patientId': patientId,
      'appointmentId': appointmentId, 
      'dayOfWeek': dayOfWeek,
      'dayOfMonth': dayOfMonth,
      'TimeOfDay': timeOfDay, 
      'month': month,
      'Year': year,
      'doctorName': doctorName,
      'patientName': patientName,
      'appointmentStatus':
          appointmentStatus, 
      'img': img,
      'doctorimg': doctorImg,
    };
  }
}
