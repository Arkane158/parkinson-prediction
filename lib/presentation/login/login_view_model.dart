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

      if (response.status == 200) {
        emit(HideLoadingState());
        // var doctor = response.doctor;
        // print(doctor?.address);
        // print(email);
        // print(doctor?.endTime);
        // print(doctor?.startTime);
        // print(doctor?.step);
        // print(doctor?.name);
        // print(doctor?.workdays);
        // print(doctor?.phone);

        if (response.doctor?.phone != null) {
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
        }
        if (response.doctor?.img != null) {
          await DoctorPreference.saveUserImg(img: response.doctor!.img!);
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
