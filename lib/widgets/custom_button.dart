import 'package:flutter/material.dart';

Widget buildButton({
  required BuildContext context,
  required String title,
  required Color color,
  required Color color2,
  required Function function}){
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        child:  Text(title,style: TextStyle(
            color: color
        ),),
        onPressed: () {
          function();
        },
      ),
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color2
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    height: 50,
  );
}