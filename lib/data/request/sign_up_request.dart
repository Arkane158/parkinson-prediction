class SignUpRequest {
  String? password;
  String? email;
  String? phone;
  String? name;

  SignUpRequest({
  required  this.password,
 required   this.email,
   required this.phone,
   required this.name,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json)
      : password = json['password'],
        email = json['email'],
        phone = json['phone'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;
    data['name'] = name;
    return data;
  }
}
