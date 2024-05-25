import 'dart:convert';
import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:parkinson_app/data/request/add_patinet_request.dart';
import 'package:parkinson_app/data/request/appointment_request.dart';
import 'package:parkinson_app/data/request/delete_patient_request.dart';
import 'package:parkinson_app/data/request/edit_patient_request.dart';
import 'package:parkinson_app/data/request/edit_profile_request.dart';
import 'package:parkinson_app/data/request/find_patient_request.dart';
import 'package:parkinson_app/data/request/forgot_password_request.dart';
import 'package:parkinson_app/data/request/patient_list_request.dart';
import 'package:parkinson_app/data/request/reset_password_request.dart';
import 'package:parkinson_app/data/request/score_request.dart';
import 'package:parkinson_app/data/request/sign_request.dart';
import 'package:parkinson_app/data/request/sign_up_request.dart';
import 'package:parkinson_app/data/request/verification_request.dart';
import 'package:parkinson_app/data/request/verify_reset_password_request.dart';
import 'package:parkinson_app/data/response/add_patient_response.dart';
import 'package:parkinson_app/data/response/appointment_response.dart';
import 'package:parkinson_app/data/response/delete_patient_response.dart';
import 'package:parkinson_app/data/response/doctor_data_collection_response.dart';
import 'package:parkinson_app/data/response/edit_patient_response.dart';
import 'package:parkinson_app/data/response/edit_profile_image_response.dart';
import 'package:parkinson_app/data/response/edit_profile_response.dart';
import 'package:parkinson_app/data/response/find_patient_response.dart';
import 'package:parkinson_app/data/response/forgot_password_response.dart';
import 'package:parkinson_app/data/response/get_patient_list_rseponse.dart';
import 'package:parkinson_app/data/response/predict_response.dart';
import 'package:parkinson_app/data/response/reset_password_response.dart';
import 'package:parkinson_app/data/response/score_response.dart';
import 'package:parkinson_app/data/response/sigin_response.dart';
import 'package:parkinson_app/data/response/sign_up_response.dart';
import 'package:http/http.dart' as http;
import 'package:parkinson_app/data/response/verification_respones.dart';
import 'package:parkinson_app/data/response/verify_reset_password_response.dart';

class ApiManager {
  static const String baseUrl = 'parkinson-9ek4.onrender.com';
  static const String predictionBaseUrl = 'ai-server-lfce.onrender.com';
  static const String signInUrl = '/login';
  static const String signUpUrl = '/signup';
  static const String verificationUrl = '/emailverification';
  static const String forgotPasswordUl = '/forget-password';
  static const String verifyResetPasswordUl = '/Verify-code';
  static const String resetPasswordUl = '/reset-password';
  static const String doctorDataCollectionUrl = '/profile';
  static const String addPatientUrl = '/addPateint';
  static const String getPatientListUrl = '/patientList';
  static const String deletePatientUrl = '/deletePateint';
  static const String editPatientUrl = '/editPateint';
  static const String findPatientUrl = '/findPatient';
  static const String editProfileUrl = '/edit-profile';
  static const String appointmentUrl = '/apoinmments';
  static const String newImageUrl = '/new-profileImage';
  static const String scoreUrl = '/score';

  static Future<SignUpResponse> signUpRequset({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    var requestBody = SignUpRequest(
        password: password, email: email, phone: phone, name: name);
    try {
      var url = Uri.https(baseUrl, signUpUrl);

      var response = await http.post(url, body: requestBody.toJson());
      return SignUpResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<VerificationResponse> verifyAccount(
      String code, String email) async {
    var requestBody = VerificationRequest(code: code, email: email);
    var url = Uri.https(baseUrl, verificationUrl);

    var response = await http.post(url, body: requestBody.toJson());
    return VerificationResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ForgotPasswordResponse> forgotPassword(String email) async {
    var requestBody = ForgotPasswordRequest(email: email);
    var url = Uri.https(baseUrl, forgotPasswordUl);
    var response = await http.post(url, body: requestBody.toJson());
    return ForgotPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<VerifyResetPasswordResponse> verifyResetPassword(
      String email, String code) async {
    var requestBody = VerifyResetPasswordRequest(email: email, code: code);
    var url = Uri.https(baseUrl, verifyResetPasswordUl);

    var response = await http.post(url, body: requestBody.toJson());
    return VerifyResetPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ResetPasswordResponse> resetPassword(
      String email, String password) async {
    var requestBody = ResetPasswordRequest(email: email, newPassword: password);
    var url = Uri.https(baseUrl, resetPasswordUl);
    var response = await http.post(url, body: requestBody.toJson());
    return ResetPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<SignInResponse> signIn(String email, String password) async {
    var requestBody = SignInRequest(email: email, password: password);
    var url = Uri.https(baseUrl, signInUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return SignInResponse.fromJson(jsonDecode(response.body));
  }

  static Future<DoctorDataCollectionResponse> doctorDataCollection({
    required String userId,
    required File image,
    required String name,
    required String phone,
    required String address,
    required String workdays,
    required String startTime,
    required String endTime,
    required String step,
  }) async {
    try {
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("https://parkinson-9ek4.onrender.com/profile"),
      );

      // Add fields to the request
      request.fields['userId'] = userId; // Adding userId field
      request.fields['name'] = name;
      request.fields['phone'] = phone;
      request.fields['address'] = address;
      request.fields['workdays'] = workdays;
      request.fields['startTime'] = startTime;
      request.fields['endTime'] = endTime;
      request.fields['step'] = step;

      // Add the image file to the request
      var imageStream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image',
        imageStream,
        length,
        filename: 'image.jpg',
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response body into DoctorDataCollectionResponse object
        var responseBody = await response.stream.bytesToString();
        return DoctorDataCollectionResponse.fromJson(jsonDecode(responseBody));
      } else {
        // If the request was not successful, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      // If an error occurs during the request, throw an exception
      throw Exception('Failed to post data: $e');
    }
  }

  static Future<AddPatientResponse> addPatient(
      {required String userId,
      required String phone,
      required String name,
      required String age,
      required String address,
      required String gender}) async {
    var requestBody = AddPatientRequest(
        userId: userId,
        phone: phone,
        name: name,
        age: age,
        gender: gender,
        address: address);
    var url = Uri.https(baseUrl, addPatientUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return AddPatientResponse.fromJson(jsonDecode(response.body));
  }

  static Future<GetPatientListResponse> getPatientList(
      {required String userId}) async {
    var requestBody = PatientListRequest(userId: userId);
    var url = Uri.https(baseUrl, getPatientListUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return GetPatientListResponse.fromJson(jsonDecode(response.body));
  }

  static Future<DeletePatientResponse> deletePatient(
      String id, String userId) async {
    var reqeustBody = DeletePatientRequest(id: id, userId: userId);
    var url = Uri.https(baseUrl, deletePatientUrl);
    var response = await http.post(url, body: reqeustBody.toJson());
    return DeletePatientResponse.fromJson(jsonDecode(response.body));
  }

  static Future<EditPatientResponse> editPatient(
      {required String name,
      required String age,
      required String phone,
      required String address,
      required String gender,
      required String userId}) async {
    var requestBody = EditPatientRequest(
        id: userId,
        phone: phone,
        name: name,
        age: age,
        gender: gender,
        address: address);
    var url = Uri.https(baseUrl, editPatientUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return EditPatientResponse.fromJson(jsonDecode(response.body));
  }

  static Future<FindPatientResponse> findPatient(
      String param, String userId) async {
    var requestBody = FindPatientRequest(param: param, userId: userId);
    var url = Uri.https(baseUrl, findPatientUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return FindPatientResponse.fromJson(jsonDecode(response.body));
  }

  static Future<EditProfileResponse> editProfile(
      {required String userId,
      required String phone,
      required String name,
      required String address,
      required String workdays,
      required String startTime,
      required String endTime,
      required String step}) async {
    var requestBody = EditProfileRequest(
        userId: userId,
        phone: phone,
        name: name,
        address: address,
        workdays: workdays,
        startTime: startTime,
        endTime: endTime,
        step: step);
    var url = Uri.https(baseUrl, editProfileUrl);
    var response = await http.post(url, body: requestBody.toJson());
    return EditProfileResponse.fromJson(jsonDecode(response.body));
  }

  static Future<AppointmentsResponse> getAppointments(
      {required String userId}) async {
    var requestBody = AppointmentsRequest(userId: userId);
    var url = Uri.https(baseUrl, appointmentUrl);
    try {
      var response = await http.post(url, body: requestBody.toJson());
      if (response.statusCode == 200) {
        return AppointmentsResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load appointments');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<EditProfileImageResponse> editProfileImage(
      File image, String id) async {
    try {
      // Create a multipart request
      var uri =
          Uri.parse('https://parkinson-9ek4.onrender.com/new-profileImage');
      var request = http.MultipartRequest('POST', uri);

      // Add the image file to the request
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: 'profile_image.jpg',
      );
      request.files.add(multipartFile);
      // Add other fields to the request
      request.fields['_id'] = id;

      // Send the request
      var response = await request.send();

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        return EditProfileImageResponse.fromJson(jsonResponse);
      } else {
        // If the request was not successful, throw an exception
        throw Exception(
            'Failed to edit profile image: ${response.reasonPhrase}');
      }
    } catch (e) {
      // If an error occurs during the request, throw an exception
      throw Exception('Failed to edit profile image: $e');
    }
  }

  static Future<PredictResponse> predict(File file) async {
    try {
      // Create a multipart request
      var uri = Uri.parse('https://ai-server-lfce.onrender.com/predict');
      var request = http.MultipartRequest('POST', uri);

      // Add the file to the request
      var stream = http.ByteStream(file.openRead());
      var length = await file.length();
      var multipartFile = http.MultipartFile(
        'file',
        stream,
        length,
        filename: file.path.split('/').last,
      );
      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        return PredictResponse.fromJson(jsonResponse);
      } else {
        // If the request was not successful, throw an exception
        throw Exception('Failed to upload file: ${response.reasonPhrase}');
      }
    } catch (e) {
      // If an error occurs during the request, throw an exception
      throw Exception('Failed to upload file: $e');
    }
  }

  static Future<ScoreResponse> score(String userId, String score)async {
    var url = Uri.https(baseUrl, scoreUrl);
    var requestBody = ScoreRequest(userId: userId, score: score);
    var response = await http.post(url, body: requestBody.toJson());
    return ScoreResponse.fromJson(jsonDecode(response.body));
  }
}
