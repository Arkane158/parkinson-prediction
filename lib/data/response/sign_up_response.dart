class SignUpResponse {
  String? message;
  int? status;

  SignUpResponse({
    this.message,
    this.status,
  });

  SignUpResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
