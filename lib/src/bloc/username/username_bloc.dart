import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'username_event.dart';
part 'username_state.dart';

class UsernameBloc extends Bloc<UsernameEvent, UsernameState> {
  UsernameBloc() : super(UsernameState()) {
    on<UsernameEvent>((event, emit) {
      //saveUsername
      on<saveUsername>((event,emit){
        emit(state.copyWith(username: state.username));
      });

      //savePassword
      on<saveUsername>((event,emit){

      });
    });

  }
}
