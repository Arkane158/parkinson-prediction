class Doctor {
  String? id;
  String? password;
  String? email;
  String? phone;
  String? name;

  Doctor({
    this.id,
    this.password,
    this.email,
    this.phone,
    this.name,
  });

  Doctor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        password = json['password'],
        email = json['email'],
        phone = json['phone'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;
    data['name'] = name;
    return data;
  }
}
