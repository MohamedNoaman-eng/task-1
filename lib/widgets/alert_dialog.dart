

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/db/user_db.dart';
import 'package:task1/model/customer.dart';

import '../bloc/cubit/app_cubit.dart';
import 'custom_button.dart';

Widget buildDialog(BuildContext context,Customer model,Function function){
  var controller = TextEditingController();
  return AlertDialog(
    title: const Text('Send Money Transaction'),
    content: const Text('This Transaction may take some minutes. \n'
        'Please enter a valid number to send to this user.\n'
        'If you sure about this transaction press confirm.\n'
    ),
    actions: <Widget>[
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: "Enter the money to send... ",
            filled: true,suffix: Text("\$"),
            label: Text("Money to send",style: TextStyle(color: Colors.blue),)
        ),
      ),
      SizedBox(height: 10.0,),
      Row(
        children: [
          buildButton(context: context, title: "Cancel", color: Colors.white, function: (){
            Navigator.pop(context);
          },color2: Colors.black),
          buildButton(context: context, title: "Confirm", color: Colors.white, function: (){
            BlocProvider.of<AppCubit>(context).makeTransaction(model: 
            Customer(id: model.id, name:model.name, email: model.email, currentBalance: model.currentBalance+int.parse(controller.text))).then((value) {
              Navigator.pop(context);
            });
          },color2: Colors.blue)
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      )
    ],
  );
}