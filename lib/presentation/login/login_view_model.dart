import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel() : super(LoadingState());
  void login(String email, String password) async {
    try {
      emit(LoadingState());

      var response = await ApiManager.signIn(email, password);

      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState("Login Successfully"));
      }
      if (response.status == 404) {
        emit(HideLoadingState());

        emit(ErrorState(response.message ));
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
  SuccessState(this.message);
}

class HideLoadingState extends LoginState {}
