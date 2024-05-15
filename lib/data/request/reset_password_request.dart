class ResetPasswordRequest {
  String? email;
  String? newPassword;

  ResetPasswordRequest({
    required this.email,
    required this.newPassword,
  });

  ResetPasswordRequest.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        newPassword = json['newPassword'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['newPassword'] = newPassword;
    return data;
  }
}
