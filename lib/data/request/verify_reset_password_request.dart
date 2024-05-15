class VerifyResetPasswordRequest {
  String? email;
  String? code;

  VerifyResetPasswordRequest({
    required this.email,
    required this.code,
  });

  VerifyResetPasswordRequest.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        code = json['code'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['code'] = code;
    return data;
  }
}
