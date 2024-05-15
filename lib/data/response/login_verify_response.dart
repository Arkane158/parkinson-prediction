class LoginVerifyResponse {
  String? message;
  int? status;
  String? userId;
  bool? profileCheck;

  LoginVerifyResponse({
    this.message,
    this.status,
    this.userId,
    this.profileCheck,
  });

  LoginVerifyResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        status = json['status'],
        userId = json['UserId'],
        profileCheck = json['Profilecheck'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['UserId'] = userId;
    data['Profilecheck'] = profileCheck;
    return data;
  }
}
