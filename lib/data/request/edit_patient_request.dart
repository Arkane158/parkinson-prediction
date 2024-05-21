// Request Model
class EditPatientRequest {
  final String id;
  final String phone;
  final String name;
  final String age;
  final String gender;
  final String address;

  EditPatientRequest({
    required this.id,
    required this.phone,
    required this.name,
    required this.age,
    required this.address,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'age': age,
      'gender': gender,
      'address': address
    };
  }
}
