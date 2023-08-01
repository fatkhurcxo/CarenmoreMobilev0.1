import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdatePesanan {
  final int? message;
  // final int? data;

  UpdatePesanan({this.message});

  Future updatePesanan(String ref) async {
    // https: //kaptenojak.my.id/api/updatepesanan
    try {
      final response =
          await http.patch(Uri.parse("http://192.168.227.62/api/detail/$ref"));

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);

        return UpdatePesanan(message: data['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
