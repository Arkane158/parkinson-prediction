class ScoreResponse {
  final String message;
  final int status;

  ScoreResponse({required this.message, required this.status});

  factory ScoreResponse.fromJson(Map<String, dynamic> json) {
    return ScoreResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}