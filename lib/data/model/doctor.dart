class Doctor {
  String? id;
  String? password;
  String? email;
  String? phone;
  String? name;
  String? img; // Add image parameter
  String? address; // Add address parameter
  List<String>? workdays; // Add workdays parameter
  String? startTime; // Add startTime parameter
  String? endTime; // Add endTime parameter
  String? step; // Add step parameter
  String? profileId;

  Doctor(
      {this.id,
      this.password,
      this.email,
      this.phone,
      this.name,
      this.img,
      this.address,
      this.workdays,
      this.startTime,
      this.endTime,
      this.step,
      this.profileId});

  Doctor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        password = json['password'],
        email = json['email'],
        phone = json['phone'],
        name = json['name'],
        img = json['img'],
        address = json['address'],
        workdays = json['workdays'] != null
            ? List<String>.from(json['workdays'])
            : null,
        startTime = json['startTime'],
        endTime = json['endTime'],
        profileId = json['_id'],
        step = json['step'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;
    data['name'] = name;
    data['img'] = img;
    data['address'] = address;
    data['workdays'] = workdays;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['step'] = step;
    data['_id'] = profileId;
    return data;
  }
}
