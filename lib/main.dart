import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/cubit/app_cubit.dart';
import 'package:task1/bloc/states/allstates.dart';
import 'package:task1/db/user_db.dart';
import 'package:task1/model/customer.dart';
import 'package:task1/screens/splash_screen.dart';

void main() {
 runApp(
     BlocProvider(
       create: (context)=>AppCubit(InitialState()),
       child: MyApp(),
     )
 );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List<Customer>? customers;
  @override
  void initState() {
    DataBase().openDB(context: context);

    // DataBase().get().then((value){
    //   customers = value;
    // });
    //DataBase().delete();
    for (int i = 1; i <= 10; i++) {
      DataBase().insert(
          customer: Customer(
              id: i,
              name: "user$i",
              email: "user$i@gmail.com",
              currentBalance: 250.32 * i),
          context: context);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task1",
      home: SplashScreen()
    );
  }
}

