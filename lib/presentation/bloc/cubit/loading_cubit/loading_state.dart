import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_state.freezed.dart';

@freezed
class LoadingState with _$LoadingState {
  const factory LoadingState.initial() = _Initial;
  const factory LoadingState.loading({
    String? message,
    Color? messageColor,
    bool? useFanLoader,
    (String, void Function(), int?)? action1,
    (String, void Function(), int?)? action2,
  }) = _Loading;
}
