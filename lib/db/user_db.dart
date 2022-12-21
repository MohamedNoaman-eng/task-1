import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task1/model/customer.dart';
import 'package:task1/widgets/snak_bar.dart';

class DataBase{
  void  openDB({required BuildContext context}) async{
    try{
      var db = await openDatabase("Bank");
      db.execute("Create table customer("
          "id int primary key ,"
          "email varchar(255),"
          "name varchar(255),"
          "currentBalance double)").then((value){
        showSnakBar(context: context, msg: "DB created successfully");

      }).catchError((onError){
        showSnakBar(context: context, msg: "error on created DB");
      });
    }catch(e){
      showSnakBar(context: context, msg: "error on created DB");
    }
  }
  Future<void> insert({required Customer customer,required BuildContext context}) async {
    var db = await openDatabase("Bank");
     db.insert("customer", customer.toMap()).then((value) {
       showSnakBar(context: context, msg: "insert successfully");

     }).catchError((onError){
       showSnakBar(context: context, msg: "error on inserted");

     });

  }
  Future<void> delete()async{
    var db = await deleteDatabase("Bank");
}
  Future<List<Customer>> get() async {

    var db = await openDatabase("Bank");
    List<Map<String, dynamic>> result = await db.query('customer');
    List<Customer> customers = [];

    if (result != null) {
      result.forEach((element) {
        customers.add(Customer.fromMap(element, element['id']));
      });
    }

    return customers;
  }
  Future<void> update({required Customer model}) async {

    var db = await openDatabase("Bank");
    db.update('customer', model.toMap(),
        where: "id= ?", whereArgs: [model.id]).then((value) {
    }).catchError((onError) {

    });
  }
}