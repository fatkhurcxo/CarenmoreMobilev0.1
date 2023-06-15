import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdatePesanan {
  final String? message;
  final int? data;

  UpdatePesanan({this.message, this.data});

  Future updatePesanan(String ref) async {
    try {
      final response = await http
          .patch(Uri.parse("https://kaptenojak.my.id/api/updatepesanan/$ref"));

      print(response.statusCode);
      if (response.statusCode == 202) {
        final data = json.decode(response.body);
        print(data);

        return UpdatePesanan(message: data['message'], data: data['data']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
