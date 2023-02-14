part of 'login_bloc.dart';

class LoginState extends Equatable {
  final int count;
  final String username;

  const LoginState({this.count = 2,this.username="test"});

  LoginState copyWith({int? count,String? username}){
    return LoginState(count: count ?? this.count,username: username ?? this.username );
}

  @override
  List<Object?> get props => [count];
}
