import 'package:cmflutter0/src/bloc/login/login_bloc.dart';
import 'package:cmflutter0/src/services/webAPI_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WebApiService().feed();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(child: Column(
        children: [
          Text("Welcome"),
          Text("debug: ${context.read<LoginBloc>().state.count}"),
         // Text("username:  ${context.read<LoginBloc>().state.username}")
        ],
      ),),
    );
  }
}
