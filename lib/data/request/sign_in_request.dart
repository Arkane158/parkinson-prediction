class SignInRequest {
  String? password;
  String? email;

  SignInRequest({
    required this.password,
    required this.email,
  });

  SignInRequest.fromJson(Map<String, dynamic> json)
      : password = json['password'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}
