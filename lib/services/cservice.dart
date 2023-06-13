import 'dart:convert';

import 'package:tugasakhir/models/customer.dart';
import 'package:http/http.dart' as http;

class Cservice {
  static Future<Customer> fetchCustomer(int customerId) async {
    final response = await http
        .get(Uri.parse("https://kaptenojak.my.id/api/customers/$customerId"));

    if (response.statusCode == 200) {
      /* get specific map */
      // print(jsonDecode(response.body)['nama']);
      return Customer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load customer");
    }
  }
}
