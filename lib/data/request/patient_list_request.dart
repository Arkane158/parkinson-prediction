class PatientListRequest {
  final String userId;

  PatientListRequest({
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
    };
  }
}
