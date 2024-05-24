class FindPatientRequest {
  final String param;
  final String userId;

  FindPatientRequest({
    required this.param,
    required this.userId
  });

  Map<String, dynamic> toJson() {
    return {
      'param': param,
      'userId': userId
    };
  }
}
