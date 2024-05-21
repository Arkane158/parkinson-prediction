import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';

class AddPatientViewModel extends Cubit<AddPatientState> {
  AddPatientViewModel() : super(LoadingState());
  void addPatient(String phone, String name, String age, String gender,String address) async {
    try {
      emit(LoadingState());
      String? userId = await DoctorPreference.getUserId();

      var response = await ApiManager.addPatient(
          phone: phone, name: name, age: age, gender: gender, userId: userId!, address: address);
   
      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState("Email Verified Successfully"));
      }
      if (response.status == 404) {
        emit(HideLoadingState());
        emit(ErrorState(response.message));
      }
    } catch (e) {
      emit(HideLoadingState());

      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }
}

abstract class AddPatientState {}

class LoadingState extends AddPatientState {}

class ErrorState extends AddPatientState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends AddPatientState {
  String message;
  SuccessState(this.message);
}

class HideLoadingState extends AddPatientState {}
