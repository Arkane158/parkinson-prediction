class Appointment {
  final String id;
  final String doctorId;
  final String patientId;
  final String dayOfWeek;
  final String dayOfMonth;
  final String timeOfDay;
  final String? month; // Nullable since it's not always present
  final String? year; // Nullable since it's not always present
  final int v;

  Appointment({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.dayOfWeek,
    required this.dayOfMonth,
    required this.timeOfDay,
    this.month,
    this.year,
    required this.v,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      doctorId: json['doctorId'],
      patientId: json['patientId'],
      dayOfWeek: json['dayOfWeek'],
      dayOfMonth: json['dayOfMonth'],
      timeOfDay: json['TimeOfDay'],
      month: json['month'], // Nullable since it's not always present
      year: json['Year'], // Nullable since it's not always present
      v: json['__v'],
    );
  }
}
