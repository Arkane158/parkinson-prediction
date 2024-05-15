import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';

class ForgotPasswordViewModel extends Cubit<ForgotPasswordState> {
  ForgotPasswordViewModel() : super(LoadingState());
  void forgotPassword(String email) async {
    try {
      emit(LoadingState());

      var response = await ApiManager.forgotPassword(email);

      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState("Code Sent Successfully"));
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

abstract class ForgotPasswordState {}

class LoadingState extends ForgotPasswordState {}

class ErrorState extends ForgotPasswordState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends ForgotPasswordState {
  String message;
  SuccessState(this.message);
}

class HideLoadingState extends ForgotPasswordState {}
