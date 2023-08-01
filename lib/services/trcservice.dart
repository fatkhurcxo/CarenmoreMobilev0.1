import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tugasakhir/models/transaksi.dart';

class TransaksiService {
  Future getDetailTransaksi(String ref) async {
    // https: //kaptenojak.my.id/api/detailtransaksi/$ref
    try {
      final response = await http
          .get(Uri.parse("http://192.168.227.62/api/makedetail/$ref"));

      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        print('it work?');
        return Transaksi(
            id: data['id'],
            layananId: data['layanan_id'],
            providerId: data['provider_id'],
            customerId: data['customer_id'],
            berlangganan: data['berlangganan'],
            reference: data['reference'],
            pembayaran: data['pembayaran'],
            status: data['status'],
            nominal: data['nominal']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
