class LoginResponse {
  String? url;
  String? password;
  String? email;
  int? status;

  LoginResponse({
    this.url,
    this.password,
    this.email,
    this.status,
  });

  LoginResponse.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        password = json['password'],
        email = json['email'],
        status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['password'] = password;
    data['email'] = email;
    data['status'] = status;
    return data;
  }
}
