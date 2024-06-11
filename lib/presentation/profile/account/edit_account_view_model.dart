import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';
import 'package:parkinson_app/prefrence/doctor_save_shared_prefrence.dart';

class EditAccountViewModel extends Cubit<EditAccountState> {
  EditAccountViewModel() : super(LoadingState());

  void editProfileImage(
    File image,
  ) async {
    try {
      emit(LoadingState());
      String? userId = await DoctorPreference.getProfileId();
      var response = await ApiManager.editProfileImage(image, userId!);

      if (response.status == 200) {
        emit(HideLoadingState());

        DoctorPreference.saveUserImg(img: response.img);
        emit(SuccessState(response.message.toString()));
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

  void editProfile({
    required String phone,
    required String name,
    required String address,
    required String workdays,
    required String startTime,
    required String endTime,
    required String about,
    required String title,
    required String whatsapp,
    required String step,
  }) async {
    try {
      emit(LoadingState());
      String? userId = await DoctorPreference.getUserId();
      var response = await ApiManager.editProfile(
          about: about,
          title: title,
          whatsapp: whatsapp,
          userId: userId!,
          phone: phone,
          name: name,
          address: address,
          workdays: workdays,
          startTime: startTime,
          endTime: endTime,
          step: step);
      await DoctorPreference.saveUserName(name: name);
      await DoctorPreference.saveUserPhone(phone: phone);
      await DoctorPreference.saveUserEndTime(endTime: endTime);
      await DoctorPreference.saveUserStartTime(startTime: startTime);
      await DoctorPreference.saveUserWorkdays(workdays: workdays.toString());
      await DoctorPreference.saveUserAddress(address: address);
      await DoctorPreference.saveUserStep(step: step);
      await DoctorPreference.saveUserAbout(about: about);
      await DoctorPreference.saveUserTitle(title: title);
      await DoctorPreference.saveUserWhatsapp(whatsapp: whatsapp);

      if (response.status == 200) {
        emit(HideLoadingState());

        emit(SuccessState(response.message.toString()));
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

abstract class EditAccountState {}

class LoadingState extends EditAccountState {}

class ErrorState extends EditAccountState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends EditAccountState {
  String message;
  SuccessState(this.message);
}

class HideLoadingState extends EditAccountState {}
