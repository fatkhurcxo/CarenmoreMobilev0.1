// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:tugasakhir/models/customer.dart';
import 'package:tugasakhir/models/mobil.dart';
import 'package:tugasakhir/services/paymentservice.dart';
import 'package:tugasakhir/user/detailpembayaran.dart';
import 'package:tugasakhir/user/order.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugasakhir/user/pembayaran.dart';
import 'package:tugasakhir/user/pesanan.dart';
import '../models/payment.dart';
// import 'package:tugasakhir/screen/keterangan.dart';

class DetailMobil extends StatefulWidget {
  const DetailMobil({Key? key, required this.mobil, required this.customer})
      : super(key: key);
  final Mobil mobil;
  final Customer customer;

  @override
  State<DetailMobil> createState() => _DetailMobilState();
}

class _DetailMobilState extends State<DetailMobil> {
  // late Future<List<String>> futurePayment;
  List listPayment = [];
  List responPayment = [];

  // List<Payment> dataPayment = [];
  /* definse payment class */
  PaymentService makePayment = PaymentService();

  var value;

  Future getChannels() async {
    final response = await http
        .get(Uri.parse("https://kaptenojak.my.id/api/tripaychannels"));

    setState(() {
      listPayment = json.decode(response.body)['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getChannels();
  }

  @override
  Widget build(BuildContext context) {
    // print(listPayment);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Layanan"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/mobil.png",
                width: 400,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.mobil.nama,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.blueAccent),
          ),
          Text('Haga: ${widget.mobil.harga}'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Description : ${widget.mobil.deskripsi}',
              maxLines: 15,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.brown,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Text(
              'Metode Pembayaran:',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                hint: const Text('Pilih metode pembayaran'),
                items: listPayment.map((item) {
                  // print(item['code']);
                  return DropdownMenuItem(
                    value: item['code'].toString(),
                    child: Text(item['code'].toString()),
                  );
                }).toList(),
                onChanged: (newVal) {
                  setState(() {
                    value = newVal;
                  });
                },
                value: value,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                Payment response = await makePayment.makePayment(
                    widget.mobil.id,
                    widget.customer.id,
                    widget.mobil.providerId,
                    widget.mobil.nama,
                    widget.mobil.harga,
                    value);
                if (response.status == "proses") {
                  print(response.pembayaran);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailpesanan(
                            customer: widget.customer,
                            mobil: widget.mobil,
                            payment: response),
                      ));
                  /* final function */
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Pesanan(
                  //               payment: response,
                  //             )));
                } else {
                  print("response null");
                }
              },
              child: const Text("Pesan Sekarang"))
        ],
      ),
    );
  }
}
