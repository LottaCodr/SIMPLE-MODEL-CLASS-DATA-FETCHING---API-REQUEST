import 'package:flutter/material.dart';
import 'package:iconstest/apiCalls.dart';

import 'UserModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<UserModel>> userList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userList = ApiCalls().getUserApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: FutureBuilder(
          future: ApiCalls().getUserApi(),
          builder: (context, AsyncSnapshot<List<UserModel>> snapShot) {
            if (snapShot.hasData) {
              return Center(
                child: Container(
                  child: ListView.builder(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, int index) {
                        return Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                                'This is the text: ${snapShot.data![index].userName.toString()}'),
                          ),
                        );
                      }),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )),
      ),
    );
  }
}
