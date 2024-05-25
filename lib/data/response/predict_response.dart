class PredictResponse {
  final int status;
  final String prediction;
  final String message;

  PredictResponse({
    required this.status,
    required this.prediction,
    required this.message,
  });

  factory PredictResponse.fromJson(Map<String, dynamic> json) {
    return PredictResponse(
      status: json['status'] ?? 0,
      prediction: json['prediction'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
