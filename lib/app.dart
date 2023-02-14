//state with no lib, so its cannot have an value

import 'package:cmflutter0/src/bloc/login/login_bloc.dart';
import 'package:cmflutter0/src/bloc/username/username_bloc.dart';
import 'package:cmflutter0/src/login/login_page.dart';
import 'package:cmflutter0/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider(create: (context) => LoginBloc());
    return MultiBlocProvider(
      providers: [loginBloc],
      child: MaterialApp(
        title: "CMApp",
        routes: AppRoute.all,
        home: LoginPage(),
      ),
    );
  }
}
