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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Welcome"),
              Text("debug: ${context.read<LoginBloc>().state.count}"),
              SizedBox(
                height: 20,
              ),
              Container(
                child: FutureBuilder(
                    future: WebApiService().feed(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) {
                        return Text("Loading...");
                      }

                      final youtubes = snapshot.data;

                      //Low Performance
                      return Column(
                        children: [
                          ...youtubes!.map((e) => TextButton(
                                onPressed: () => {print(e.title)},
                                child: Card(
                                    child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.network(e.avatarImage),
                                      ],
                                    ),
                                    Text(e.title.toString()),
                                    Text(e.subtitle.toString())
                                  ],
                                )),
                              ))
                        ],
                      );

                      //Better way
                      // return ListView.builder(
                      //   itemCount: youtubes!.length,
                      //   itemBuilder: (context, index) {
                      //     return Card(
                      //       margin: EdgeInsets.all(10),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(youtubes![index].title)
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );
                    }),
              )
              // Text("username:  ${context.read<LoginBloc>().state.username}")
            ],
          ),
        ),
      ),
    );
  }
}
