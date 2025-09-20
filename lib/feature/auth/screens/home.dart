import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_template/core/utility/app_colors.dart';
import '../../auth/screens/signin.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() =>  Signin());
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.users.isEmpty) {
            return const Center(child: Text("No users found."));
          }

          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];

              return Card(
                color: AppColor.primaryColor,
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ID: ${user['id']}"),
                      Text("Name: ${user['name'] ?? ''}"),
                      Text("Email: ${user['email'] ?? ''}"),
                      Text("Password: ${user['password'] ?? ''}"),
                      Text("Country: ${user['country'] ?? ''}"),
                      Text("DOB: ${user['dob'] ?? ''}"),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
