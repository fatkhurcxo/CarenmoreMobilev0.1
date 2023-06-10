import 'package:flutter/material.dart';
import 'dart:async';

class Pesanan extends StatefulWidget {
  const Pesanan({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Menunggu Pesanan'),
        //leading: Container(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Mohon Ditunggu',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Karyawan Kami Sedang Perjalanan Ke Alamat Anda',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 70),
          Center(
            child: Text(
              '$_secondsRemaining',
              style: TextStyle(fontSize: 72),
            ),
          ),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () async {
              Navigator.pushNamed(context, 'selesai');
            },
            child: Text('Selesaikan Pesanan'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(130, 40),
              primary: Color(0xFF2F9DF5),
              textStyle: TextStyle(color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
