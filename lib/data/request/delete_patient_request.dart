class DeletePatientRequest {
  final String id;
  final String userId;

  DeletePatientRequest({
    required this.userId,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId};
  }
}
