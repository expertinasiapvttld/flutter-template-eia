// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'common_event.dart';
part 'common_state.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc() : super(CommonInitial()) {
    on<SetLocaleEvent>((event, emit) {
      emit(LocaleLoadedState(event.locale));
    });
  }
}
