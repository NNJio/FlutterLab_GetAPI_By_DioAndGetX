import 'package:dio/dio.dart';

class UserService {
  var dio = Dio();

  Future<dynamic> userService() async {
    return await dio.get('https://jsonplaceholder.typicode.com/users');
    
  }
}
