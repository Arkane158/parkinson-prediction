import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';

class EditPatientInfoViewModel extends Cubit<EditPatientInfoState> {
  EditPatientInfoViewModel() : super(LoadingState());

  void editPatient(String id, String name, String phone, String age,
      String address, String gender) async {
    try {
      emit(LoadingState());

      var response =
          await ApiManager.editPatient(name: name, age: age, phone: phone, address: address, gender: gender, userId: id);
      emit(HideLoadingState());

      if (response.status == 200) {
        emit(SuccessState("Patient list fetched successfully"));
      } else {
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

abstract class EditPatientInfoState {}

class LoadingState extends EditPatientInfoState {}

class HideLoadingState extends EditPatientInfoState {}

class ErrorState extends EditPatientInfoState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends EditPatientInfoState {
  String message;
  SuccessState(this.message);
}
