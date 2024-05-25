import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';

class PredictViewModel extends Cubit<PredictState> {
  PredictViewModel() : super(LoadingState());

  void predict(File file, String patientId) async {
    try {
      emit(LoadingState());

      var response = await ApiManager.predict(file);

      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState(response.prediction));
        await ApiManager.score(patientId, response.prediction);
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
}

abstract class PredictState {}

class LoadingState extends PredictState {}

class ErrorState extends PredictState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends PredictState {
  String message;
  int? score;
  SuccessState(this.message);
}

class HideLoadingState extends PredictState {}
