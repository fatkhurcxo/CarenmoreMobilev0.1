import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tugasakhir/models/payment.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({Key? key, required this.payment}) : super(key: key);
  final Payment payment;
  @override
  _PesananState createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  int _secondsRemaining = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_secondsRemaining < 1) {
            timer.cancel();
            print(widget.payment.checkoutUrl);
            // Timer berakhir, lakukan tindakan yang diinginkan di sini
          } else {
            _secondsRemaining = _secondsRemaining - 1;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_secondsRemaining == 0) {
      print("waktu habis");
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pesanan'),
        //leading: Container(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Menunggu konfirmasi pesanan oleh admin',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          Center(
            child: Text(
              '$_secondsRemaining',
              style: const TextStyle(fontSize: 72),
            ),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () async {
              Navigator.pushNamed(context, 'selesai');
            },
            child: Text('Selesaikan Pesanan'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(130, 40),
              primary: Color(0xFF2F9DF5),
              textStyle: const TextStyle(color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
