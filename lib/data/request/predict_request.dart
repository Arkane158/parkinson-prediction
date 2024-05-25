class PredictRequest {
  final String file;

  PredictRequest({
    required this.file,
  });

  Map<String, dynamic> toJson() {
    return {
      'file': file,
    };
  }
}
