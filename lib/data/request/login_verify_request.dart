class LoginVerificationRequest {
  String? email;
  String? password;

  LoginVerificationRequest({
    required this.email,
    required this.password,
  });

  LoginVerificationRequest.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
