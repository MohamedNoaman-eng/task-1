import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/cubit/app_cubit.dart';
import 'package:task1/bloc/states/allstates.dart';
import 'package:task1/widgets/alert_dialog.dart';
import 'package:task1/widgets/custom_button.dart';
import 'package:task1/widgets/user_widget.dart';

import '../db/user_db.dart';
import '../model/customer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Customer> customers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Customers"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Customer>>(
        future: DataBase().get(), // async work
        builder: (BuildContext context,
            AsyncSnapshot<List<Customer>> snapshot) {
          if (snapshot.hasData) {
            return BlocConsumer<AppCubit, AppState>(builder: (context, state) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),

                ),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: userWidget(context: context,
                          snapshot: snapshot.data![index],
                          index: index,
                      function: (){},
                    ));
                  },
                ),
              );
            }, listener: (context, state) {
              if (state is TransactionSuccessState) {
                setState(() {
                  var snackBar = SnackBar(content: Text('Transaction done successfully'),backgroundColor: Colors.green,);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });

              }
            });
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}