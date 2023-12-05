import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmas/pages/home_screen.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2500)).then((value) => {
      Get.offAll(HomeScreen())
    });
   return  Scaffold(
     body: Container(
       decoration: BoxDecoration(color: Colors.white),
       child: Center(
         child: Icon(Icons.child_care_sharp,color: Colors.red,size: 100,),
       ),
     ),
   );
  }

}