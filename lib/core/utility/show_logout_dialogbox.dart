// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:maditation_tracker/core/widgets/custom_text.dart';
// import 'package:maditation_tracker/feature/auth/controller/user_controller.dart';
//
// void showLogoutDialog(BuildContext context, UserController userController) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Center(
//           child: Container(
//             height: 150.h,
//             margin: const EdgeInsets.all(20),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10.r),
//               ),
//               color: Colors.white,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomText(
//                           text: 'Confirmation',
//                           size: 18.sp,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                         Wrap(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(top: 10.h),
//                               child: Text(
//                                 "Are you sure want to Logout?",
//                                 style: GoogleFonts.inter(
//                                     color: Colors.black,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Get.back();
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.all(10.sp),
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white.withOpacity(0.3),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10.r),
//                                   ),
//                                 ),
//                                 child: CustomText(
//                                   text: "Cencel",
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black,
//                                   size: 18.sp,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 userController.signOut();
//                                 // Get.back();
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.all(10.sp),
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white.withOpacity(0.3),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10.r),
//                                   ),
//                                 ),
//                                 child: CustomText(
//                                   text: "Ok",
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black,
//                                   size: 18.sp,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       });
// }
