import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugasakhir/models/payment.dart';

class PaymentService {
  Future makePayment(int layananId, int customerId, String providerId,
      String namaLayanan, String nominal, String code) async {
    try {
      // print("status aman");
      final response =
          await http.post(Uri.parse("https://kaptenojak.my.id/api/makepayment"),
              headers: {
                "content-type": "application/json",
              },
              body: json.encode({
                "layananId": layananId,
                "customerId": customerId,
                "providerId": providerId,
                "namaLayanan": namaLayanan,
                "nominal": nominal,
                "code": code
              }));
      if (response.statusCode == 201) {
        var data = json.decode(response.body)['data'];
        print(data);
        // var data = json.encode(response.body);
        return Payment(
            reference: data['reference'],
            pembayaran: data['pembayaran'],
            status: data['status'],
            dibuat: data['created_at'],
            nominal: data['nominal'],
            checkoutUrl: data['payment_url']);
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  // static Future postPesanan(int layananId, int customerId, String providerId,
  //     String nominal, String code) async
  //     {
  //   try {
  //     final response = await http
  //         .post(Uri.parse("https://kaptenojak.my.id/api/makepayment"), body: {
  //       "layananId": layananId,
  //       "customerId": customerId,
  //       "providerId": providerId,
  //       "nominal": nominal,
  //       "code": code
  //     });

  //     print(response.body);
  //     if (response.statusCode == 201) {
  //       final data = jsonDecode(response.body)['data'];
  //       print(data);
  //       print(jsonDecode(response.body)['data']);
  //       Iterable itr = data;
  //       List<Payment> payment = itr.map((e) => Payment.fromJson(e)).toList();
  //       print(mobil);
  //       return data;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
