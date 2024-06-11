class Doctor {
  String? id;
  String? phone;
  String? name;
  String? img;
  String? address;
  List<String>? workdays;
  String? startTime;
  String? endTime;
  String? step;
  String? profileId;
  String? title;
  String? about;
  String? whatsapp;

  Doctor(
      {this.id,
      this.phone,
      this.name,
      this.img,
      this.address,
      this.workdays,
      this.startTime,
      this.endTime,
      this.step,
      this.profileId,
      this.about,
      this.whatsapp,
      this.title});

  Doctor.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        phone = json['phone'],
        name = json['Name'], // Use 'Name' as per the provided JSON response
        img = json['img'],
        address = json['address'],
        workdays = json['workdays'] != null
            ? List<String>.from(json['workdays'])
            : null,
        startTime = json['startTime'],
        endTime = json['endTime'],
        step = json['step'],
        profileId = json['_id'],
        about = json['about'],
        whatsapp=json['whatsapp'],
        title = json['title'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['phone'] = phone;
    data['Name'] = name;
    data['img'] = img;
    data['address'] = address;
    data['workdays'] = workdays;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['step'] = step;
    data['title'] = title;
    data['whatsapp'] = whatsapp;
    data['about'] = about;
    return data;
  }
}
