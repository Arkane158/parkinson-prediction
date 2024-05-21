import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel() : super(LoadingState());
  void login(String email, String password) async {
    try {
      emit(LoadingState());

      var response = await ApiManager.signIn(email, password);
      print(response.doctor!.img);

      if (response.status == 200) {
        emit(HideLoadingState());
        if (response.profileCheck == false && response.doctor != null) {
          var doctor = response.doctor;
          await DoctorPreference.saveUserData(
            email: email,
            phone: doctor!.phone!,
            name: doctor.name!,
            address: doctor.address!,
            workdays: doctor.workdays.toString(),
            startTime: doctor.startTime!,
            endTime: doctor.endTime!,
            step: doctor.step!,
          );
          print(doctor.img);
          await DoctorPreference.saveUserImg(img: doctor.img!);
        }

        await DoctorPreference.saveUserId(id: response.userId);

        emit(SuccessState("Login Successfully", response.profileCheck));
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

abstract class LoginState {}

class LoadingState extends LoginState {}

class ErrorState extends LoginState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends LoginState {
  String message;
  bool firstTime;
  SuccessState(this.message, this.firstTime);
}

class HideLoadingState extends LoginState {}
