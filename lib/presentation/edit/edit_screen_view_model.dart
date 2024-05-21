import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';
import 'package:parkinson_app/data/model/patient.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';

class EditViewModel extends Cubit<EditState> {
  EditViewModel() : super(LoadingState());

  List<Patient> patients = [];

  void getPatientList() async {
    patients = [];

    print(patients);
    try {
      emit(LoadingState());
      String? userId = await DoctorPreference.getUserId();

      var response = await ApiManager.getPatientList(userId: userId!);

      if (response.status == 200) {
        patients = response.result; // Update patients list
        print(patients[0].address);
        emit(SuccessState("Patient list fetched successfully"));
      } else {
        emit(ErrorState("Failed to fetch patient list"));
      }
    } catch (e) {
      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }

  void deletePatient(String id) async {
    try {
      emit(LoadingState());
      String? userId = await DoctorPreference.getUserId();

      var response = await ApiManager.deletePatient(id, userId!);

      if (response.status == 200) {
        emit(SuccessState("Patient list fetched successfully"));
      } else {
        emit(ErrorState(response.message));
      }
    } catch (e) {
      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }
}

abstract class EditState {}

class LoadingState extends EditState {}

class ErrorState extends EditState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends EditState {
  String message;
  SuccessState(this.message);
}
