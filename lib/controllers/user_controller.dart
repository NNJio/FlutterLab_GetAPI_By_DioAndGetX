import 'package:get/get.dart';
import 'package:get_api/models/user_model.dart';
import 'package:get_api/services/user_service.dart';

class UserController extends GetxController {
  var user = <User>[].obs; // สร้างตัวแปรเก็บ model
  void fetchUser() async {
    //สร้าง method
    UserService request = UserService(); //สร้าง request = UserService
    request.userService().then((value) {
      if (value.statusCode == 200) {
        for (var item in value.data) {
          user.add(User.fromJson(item));
        }
      } else {
        print('Error');
      }
    }).catchError((onError) {
      printError();
    });
  }
}
