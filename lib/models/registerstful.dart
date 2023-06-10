import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterStful {
  bool create;
  String message;

  RegisterStful({required this.create, required this.message});

  static Future<RegisterStful> regisAPI(
      String nama, String email, String password) async {
    Uri customerUrl = Uri.parse("https://kaptenojak.my.id/api/customers");

    var response = await http.post(customerUrl,
        body: {"name": nama, "email": email, 'password': password});

    var data = json.decode(response.body);
    // var finalData = data['data'];

    return RegisterStful(create: data['create'], message: data['message']);
  }
}
