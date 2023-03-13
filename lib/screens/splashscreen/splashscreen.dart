import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashtimer(){
    Timer(Duration(seconds: 2),(){
      Get.toNamed('/login');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashtimer();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Stack(fit: StackFit.expand,
          children: [
            Image.asset("assets/images/bppicture.png",fit: BoxFit.fill,),
            Center(child: Image.asset("assets/images/logo.png",)),

          ],
        ),
      );
  }
}

