import 'dart:convert';

import 'package:tugasakhir/models/customer.dart';
import 'package:http/http.dart' as http;

class Cservice {
  static Future<Customer> fetchCustomer(int customerId) async {
    final response = await http
        .get(Uri.parse("http://192.168.227.62:80/api/userdetail/$customerId"));
    // https: //kaptenojak.my.id/api/customers/$customerId

    if (response.statusCode == 200) {
      /* get specific map */
      print(jsonDecode(response.body));
      print('harus berhasil donggggggggg');
      return Customer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Anjay masak gagal");
    }
  }
}
