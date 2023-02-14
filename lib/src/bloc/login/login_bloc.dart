import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cmflutter0/app.dart';
import 'package:cmflutter0/src/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/user.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    //add
    on<LoginEventAdd>((event, emit) async {
      // execute something
      await Future.delayed(Duration(seconds: 3));
      emit(state.copyWith(count: state.count + 1));
    });

    //remove
    on<LoginEventRemove>((event, emit) {
      emit(state.copyWith(count: state.count - 1));
    });

    //saveLogin
    on<LoginEventLogin>((event, emit) {
      if (event.payload.username == "admin" &&
          event.payload.password == "1234") {
        emit(state.copyWith(isAuth: true));
        //change but its can't go back
        if (navigatorState.currentContext != null) {
          Navigator.pushReplacementNamed(
              navigatorState.currentContext!, AppRoute.home);
        }
      } else {
        emit(state.copyWith(isAuth: false));
      }
    });
  }
}
