import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/global_widget/custom_button.dart';
import '../../../core/route/app_route.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
SizedBox(height: 400.h,),
          Center(
            child: CustomButton(
              text: "Logout",
              onPressed: (){
                Get.offAllNamed(AppRoute.signin);
              },

            ),
          ),

        ],

      ),
    );
  }
}
