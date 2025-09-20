import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_template/feature/auth/controller/signup_db_sqflite.dart';

class HomeController extends GetxController {
  var users = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final data = await SignupDatabase.instance.getUsers();
    users.assignAll(data);
    print('Fetched users: $data');
  }
}
