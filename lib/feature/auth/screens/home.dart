import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/global_widget/custom_button.dart';
import '../../auth/screens/signin.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Text(
              "Welcome to HomeScreen 🎉",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),

            // Users Table
            Expanded(
              child: Obx(() {
                if (controller.users.isEmpty) {
                  return Center(child: Text("No users found"));
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.all(color: Colors.black26),
                    columns: const [
                      DataColumn(label: Text("ID")),
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Email")),
                      DataColumn(label: Text("Password")),
                      DataColumn(label: Text("Country")),
                      DataColumn(label: Text("DOB")),
                    ],
                    rows: controller.users.map((user) {
                      return DataRow(cells: [
                        DataCell(Text(user['id'].toString())),
                        DataCell(Text(user['name'] ?? '')),
                        DataCell(Text(user['email'] ?? '')),
                        DataCell(Text(user['password'] ?? '')),
                        DataCell(Text(user['country'] ?? '')),
                        DataCell(Text(user['dob'] ?? '')),
                      ]);
                    }).toList(),
                  ),
                );
              }),
            ),

            SizedBox(height: 20.h),

            CustomButton(
              text: "Logout",
              onPressed: () {
                Get.offAll(Signin());
              },
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
