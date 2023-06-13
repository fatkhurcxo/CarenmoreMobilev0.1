import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugasakhir/models/mobil.dart';
import 'package:tugasakhir/models/motor.dart';

class Mtrservice {
  Future fetchMotor() async {
    try {
      final response =
          await http.get(Uri.parse("https://kaptenojak.my.id/api/motors"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        // print(data);
        // print(jsonDecode(response.body)['data']);
        Iterable itr = data;
        List<Motor> motor = itr.map((e) => Motor.fromJson(e)).toList();
        // print(mobil);
        return motor;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
