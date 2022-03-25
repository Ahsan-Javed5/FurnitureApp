import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  String baseUrl = "https://reqres.in/api/users";
  Dio dio = Dio();

  void createUser(String email, String password) async {
    Map<String, dynamic> userMap = {
      "name": email,
      "job": password,
    };
    var response = await dio.post(baseUrl, data: userMap);
    print(response.data);
  }
}
