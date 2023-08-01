import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterStful {
  bool create;
  String message;

  RegisterStful({required this.create, required this.message});

  static Future<RegisterStful> regisAPI(
      String nama, String email, String password) async {
    // Uri customerUrl = Uri.parse("https://kaptenojak.my.id/api/customers");
    Uri localNetwork = Uri.parse("http://192.168.227.62:80/api/usercreate");

    var response = await http.post(localNetwork,
        body: {"name": nama, "email": email, 'password': password});

    var data = json.decode(response.body);
    // var finalData = data['data'];

    return RegisterStful(create: data['create'], message: data['message']);
  }
}
