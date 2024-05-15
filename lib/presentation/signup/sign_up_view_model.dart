import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';

class SignUpViewModel extends Cubit<SignUpState> {
  SignUpViewModel() : super(LoadingState());
  void signUp(String name, String email, String password, String phone) async {
    try {
      emit(LoadingState());

      var response =
          await ApiManager.signUpRequset(email, password, name, phone);

      if (response.status == 200) {
        emit(HideLoadingState());
        emit(
            SuccessState(LoginScreen.screenName, "Email Created Successfully"));
      }
      if (response.status == 404) {
        emit(HideLoadingState());

        emit(ErrorState(response.message ?? "Something Went Wrong"));
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

abstract class SignUpState {}

class LoadingState extends SignUpState {}

class ErrorState extends SignUpState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends SignUpState {
  String screenName;
  String message;
  SuccessState(this.screenName, this.message);
}

class HideLoadingState extends SignUpState {}
