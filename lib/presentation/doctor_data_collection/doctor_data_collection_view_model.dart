import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';

class DoctorDataCollectionViewModel extends Cubit<DoctorDataCollectionState> {
  DoctorDataCollectionViewModel() : super(LoadingState());

  void doctorDataCollection(
    File image,
    String name,
    String phone,
    String address,
    String workdays,
    String startTime,
    String endTime,
    String step,
  ) async {
    try {
      emit(LoadingState());
      String? userId = await DoctorPreference.getUserId();
      var response = await ApiManager.doctorDataCollection(
          userId: userId!,
          image: image,
          name: name,
          phone: phone,
          address: address,
          workdays: workdays,
          startTime: startTime,
          endTime: endTime,
          step: step);

      if (response.status == 200) {
        emit(HideLoadingState());
        var email = await DoctorPreference.getUserEmail();
        
        DoctorPreference.saveUserImg(img: response.img);
        DoctorPreference.saveUserData(
            email: email.toString(),
            phone: phone,
            name: name,
            address: address,
            workdays: workdays,
            startTime: startTime,
            endTime: endTime,
            step: step);
        DoctorPreference.saveEditProfileId(
            editUserProfileId: response.editProfileId);
        emit(SuccessState("Succsse"));
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

abstract class DoctorDataCollectionState {}

class LoadingState extends DoctorDataCollectionState {}

class ErrorState extends DoctorDataCollectionState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends DoctorDataCollectionState {
  String message;
  SuccessState(this.message);
}

class HideLoadingState extends DoctorDataCollectionState {}
