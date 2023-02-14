part of 'username_bloc.dart';

abstract class UsernameEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class saveUsername extends UsernameEvent{}
class savePassword extends UsernameEvent{}