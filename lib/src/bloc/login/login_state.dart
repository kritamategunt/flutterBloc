part of 'login_bloc.dart';

class LoginState extends Equatable {
  final int count;
  final String username;
  final bool isAuth;


  const LoginState({this.count = 2,this.username="test",this.isAuth=false});

  LoginState copyWith({int? count,String? username,bool? isAuth}){
    return LoginState(count: count ?? this.count,username: username ?? this.username,isAuth: isAuth ?? this.isAuth);
}

  @override
  List<Object?> get props => [count,username,isAuth];
}
