class Patient {
  final String id;
  final String userId;
  final String phone;
  final String name;
  final String age;
  final String gender;
  final String illness;
  final String? address; // Add the address field
  final int v;

  Patient({
    required this.id,
    required this.userId,
    required this.phone,
    required this.name,
    required this.age,
    required this.gender,
    this.illness = '',
    this.address, // Include it in the constructor
    this.v = 0,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['_id'],
      userId: json['userId'],
      phone: json['phone'],
      name: json['Name'],
      age: json['age'],
      gender: json['gender'],
      illness: json['illness'] ?? '',
      address: json['address'], // Add it to the factory constructor
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'phone': phone,
      'Name': name,
      'age': age,
      'gender': gender,
      'illness': illness,
      'address': address ?? '', // Add it to the JSON representation
      '__v': v,
    };
  }
}
