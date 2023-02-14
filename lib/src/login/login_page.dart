import 'package:cmflutter0/src/bloc/login/login_bloc.dart';
import 'package:cmflutter0/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Card(
            shadowColor: Colors.black,
            child: Container(
              height: 320,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //... from remove array []
                  ..._buildTextFields(),
                  SizedBox(
                    height: 30,
                  ),
                  ..._buildButtons(),
                  Row(
                    children: [
                      // Text("debug: ${context.read<LoginBloc>().state.count}"),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Text("Debug#1: ${state.count} ");
                        },
                      ),
                      IconButton(
                        onPressed: () =>
                            {context.read<LoginBloc>().add(LoginEventAdd())},
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () =>
                            context.read<LoginBloc>().add(LoginEventRemove()),
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {

    print(
        "login: \nusername: ${_usernameController.text}\npassword: ${_passwordController.text}");
    Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleClickSignIn() {
    _usernameController.text = "";

    Navigator.pushNamed(context, AppRoute.register);
  }

  _buildTextFields() {
    return [
      TextField(
        controller: _usernameController,
        decoration: InputDecoration(labelText: "Username"),
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: "password"),
      ),
    ];
  }

  _buildButtons() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: Text("Login"),
      ),
      OutlinedButton(onPressed: _handleClickSignIn, child: Text("Sign-in"))
    ];
  }
}
