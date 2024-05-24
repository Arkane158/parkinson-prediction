import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';
import 'package:parkinson_app/data/model/appointment.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(LoadingState());
  List<Appointment> appointments = [];

  void getAppointment() async {
    var userId = await DoctorPreference.getUserId();
    appointments = [];

    try {
      emit(LoadingState());
      var response = await ApiManager.getAppointments(userId: userId!);
      appointments = response.result.toList();

      if (response.result.isNotEmpty) {
        emit(HideLoadingState());
        emit(SuccessState("Appointments Fetched Successfully"));
      } else {
        emit(HideLoadingState());
        emit(ErrorState("Appointments Not Found"));
      }
    } catch (e) {
      emit(HideLoadingState());

      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet Connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }
}

abstract class HomeState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends HomeState {
  final String message;
  SuccessState(this.message);
}

class HideLoadingState extends HomeState {}
