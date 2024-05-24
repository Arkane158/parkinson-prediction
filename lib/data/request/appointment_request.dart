class AppointmentsRequest {
  final String userId;

  AppointmentsRequest({
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
    };
  }
}
