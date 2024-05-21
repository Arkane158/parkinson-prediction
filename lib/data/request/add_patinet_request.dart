class AddPatientRequest {
  final String userId;
  final String phone;
  final String name;
  final String age;
  final String gender;
  final String address; // Add the address field

  AddPatientRequest({
    required this.userId,
    required this.phone,
    required this.name,
    required this.age,
    required this.gender,
    required this.address, // Include it in the constructor
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'phone': phone,
      'name': name,
      'age': age,
      'gender': gender,
      'address': address, // Add it to the JSON representation
    };
  }
}
