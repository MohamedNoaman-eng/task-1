import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task1/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() => Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>HomeScreen())),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottieFiles/bank.zip'),
      ),
    );
  }
}
