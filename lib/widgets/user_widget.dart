

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/model/customer.dart';

import 'alert_dialog.dart';

Widget userWidget({required BuildContext context,required Customer snapshot,required int index,required var function}){
  return Stack(
      alignment: Alignment(0,-1.1),
      children:[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Image(image: AssetImage("assets/images/ava.jpg"),),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20.0,),
                        Text("mohamed noaman",
                          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                        SizedBox(height: 8.0,),
                        Text(snapshot.email,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 15.0,),
                        Text("Balance",
                          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                        SizedBox(height: 8.0,),
                        Text("${snapshot.currentBalance}\$"),
                      ],
                    ),

                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:Container(
                      height: 50,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                        child: TextButton(
                          onPressed: (){
                            showDialog(context: context, builder:(context){
                              return buildDialog(context,snapshot,function);
                            }
                            );
                          },
                          child: Text("Make Transaction",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),),
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.6),
          child: Text("${index + 1}",style: TextStyle(color: Colors.white),),
        )
      ]
  );
}