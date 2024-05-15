class VerificationRequest {
  String? code;
  String? email;

  VerificationRequest({
    required this.code,
    required this.email,
  });

  VerificationRequest.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['email'] = email;
    return data;
  }
}
