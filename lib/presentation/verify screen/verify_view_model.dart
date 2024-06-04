import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';

class VerifyAccountViewModel extends Cubit<VerifyState> {
  VerifyAccountViewModel() : super(LoadingState());
  void verifyAccount(String email, String code) async {
    try {
      emit(LoadingState());
      var response = await ApiManager.verifyAccount(code, email);
      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState(response.message??'success'));
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

  void verifyResetPassword(String email, String code) async {
    try {
      emit(LoadingState());
      var response = await ApiManager.verifyResetPassword(email, code);
      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState(response.message??'success'));
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

abstract class VerifyState {}

class LoadingState extends VerifyState {}

class ErrorState extends VerifyState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends VerifyState {
  String message;
  SuccessState(this.message);
}

class HideLoadingState extends VerifyState {}
