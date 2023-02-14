import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {

    //add
    on<LoginEventAdd>((event, emit) async {
      // execute something
      await Future.delayed(Duration(seconds: 3));
      emit(state.copyWith(count: state.count+1));
    });

    //remove
    on<LoginEventRemove>((event, emit){
      emit(state.copyWith(count: state.count-1));
    });

    //saveLogin
    on<LoginEventLogin>((event, emit){
      emit(state.copyWith(isAuth: true));
      emit(state.copyWith(username: state.username));
    });
  }
}
