import 'package:flutter/material.dart';


showSnakBar({required BuildContext context, required String msg}){
  var snackBar = SnackBar(
    content: Text(msg),
  );
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  _messangerKey.currentState?.showSnackBar(
      SnackBar(content: Text(msg)));
}
