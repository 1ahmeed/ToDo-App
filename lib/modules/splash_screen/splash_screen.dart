
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/layout/home_layout.dart';

class SplashScreen extends StatelessWidget {
  static String id = 'SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.asset('assets/images/bb.png',height: 100,width: 100,),
        backgroundColor:Colors.white38 ,
        durationInSeconds:3 ,
        logoWidth: 70,
        showLoader: false,
        navigator: HomeLayout(),
      ),

    );
  }
}