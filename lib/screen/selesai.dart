import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tugasakhir/user/home.dart';

class Selesai extends StatefulWidget {
  const Selesai({
    Key ? key
  }): super(key: key);

  @override
  _SelesaiState createState() => _SelesaiState();
}

class _SelesaiState extends State < Selesai > {
  @override
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration =
      const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeWidget()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            //  Nama Pemesan
            children: [
              Text(
                'Terima Kasih Telah Mengunakan Jasa Layanan Kami',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}