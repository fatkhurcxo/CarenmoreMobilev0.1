import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginStful {
  bool login;
  String message;
  int userId;

  LoginStful(
      {required this.login, required this.message, required this.userId});

  static Future<LoginStful> loginApi(String email, String password) async {
    // Uri customerLogin = Uri.parse("https://kaptenojak.my.id/api/login");
    Uri localNetwork = Uri.parse("http://192.168.227.62:80/api/userlogin");

    var response = await http
        .post(localNetwork, body: {"email": email, "password": password});

    var data = json.decode(response.body);

    return LoginStful(
        login: data['login'],
        message: data['message'],
        userId: (data['user_id'] == null) ? 0 : data['user_id']);
  }
}
