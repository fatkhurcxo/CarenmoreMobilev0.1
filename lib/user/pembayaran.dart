import 'package:flutter/material.dart';
import 'package:tugasakhir/services/paymentservice.dart';
import '../models/payment.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({Key? key}) : super(key: key);
  // final Payment data;

  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pembayaran"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Link Pembayaran :"),
          SizedBox(height: 5),
          Text("Status :"),
          SizedBox(height: 5),
          Text("Reference :"),
          SizedBox(height: 5),
        ],
      )),
    );
  }
}
