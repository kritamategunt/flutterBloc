part of 'username_bloc.dart';

class UsernameState extends Equatable {
  final String username;

  const UsernameState({this.username="test"});

  UsernameState copyWith({String? username}){
    return UsernameState(username: username ?? this.username);
  }

  @override
  List<Object?> get props => [username];
}
