import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';
import 'package:parkinson_app/data/model/appointment.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';

class AppointmentViewModel extends Cubit<AppointmentState> {
  AppointmentViewModel() : super(LoadingState());
  List<AppointmentResult> appointments = [];
  DateTime selectedDate = DateTime.now(); // Add this line

  void getAppointment() async {
    var userId = await DoctorPreference.getUserId();
    appointments = [];

    try {
      emit(LoadingState());
      var response = await ApiManager.getAppointments(userId: userId!);
      appointments = response.result
          .where((appointment) =>
              appointment.dayOfMonth == selectedDate.day.toString() &&
              appointment.month == selectedDate.month.toString() &&
              appointment.year == selectedDate.year.toString())
          .toList(); // Filter appointments for selected date

      if (appointments.isNotEmpty) {
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

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    getAppointment(); // Refresh appointments when date changes
  }

  void canelAppoitment(
      {required String appointmentId,
      required String reserveId,
      required String timeOfDay}) async {
    try {
      emit(LoadingState());

      var response = await ApiManager.cancelAppointments(
          timeOfDay: timeOfDay,
          appointmentId: appointmentId,
          reserveId: reserveId);
      getAppointment();

      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState(response.message));
      } else if (response.status == 404) {
        emit(HideLoadingState());
        emit(ErrorState('Something '));
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

abstract class AppointmentState {}

class LoadingState extends AppointmentState {}

class ErrorState extends AppointmentState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends AppointmentState {
  final String message;
  SuccessState(this.message);
}

class HideLoadingState extends AppointmentState {}
