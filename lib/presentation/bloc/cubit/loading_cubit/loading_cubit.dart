import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(const LoadingState.initial());

  void loading({
    String? message,
    Color? messageColor,
    bool? useFan,
    (String, void Function(), int?)? action1,
    (String, void Function(), int?)? action2,
  }) {
    emit(LoadingState.loading(
      message: message,
      messageColor: messageColor,
      action1: action1,
      useFanLoader: useFan,
      action2: action2,
    ));
  }

  void loaded() {
    emit(const LoadingState.initial());
  }
}
