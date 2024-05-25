class ScoreRequest {
  final String userId;
  final String score;

  ScoreRequest({required this.userId, required this.score});

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'score': score,
    };
  }
}