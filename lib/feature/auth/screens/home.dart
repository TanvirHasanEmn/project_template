import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_template/core/global_widget/custom_button.dart';
import 'package:project_template/feature/auth/screens/signin.dart';
import 'package:project_template/feature/auth/screens/signup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40.h,),
            Text(
              "Welcome to HomeScreen 🎉",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:40),
            CustomButton(
                text: "Logout",
                onPressed:  (){
                  Get.to(Signin());
                },

            ),
          ],
        ),
      ),
    );
  }
}
