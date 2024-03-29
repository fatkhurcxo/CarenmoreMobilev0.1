import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugasakhir/models/mobil.dart';

class Mblservice {
  Future fetchMobil() async {
    try {
      final response =
          await http.get(Uri.parse("https://kaptenojak.my.id/api/mobils"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        // print(data);
        // print(jsonDecode(response.body)['data']);
        Iterable itr = data;
        List<Mobil> mobil = itr.map((e) => Mobil.fromJson(e)).toList();
        // print(mobil);
        return mobil;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
