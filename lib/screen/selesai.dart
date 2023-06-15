import 'package:flutter/material.dart';
import 'package:tugasakhir/models/customer.dart';
import 'dart:async';
import 'package:tugasakhir/user/home.dart';

class Selesai extends StatefulWidget {
  const Selesai({Key? key, required this.customer}) : super(key: key);
  final Customer customer;

  @override
  _SelesaiState createState() => _SelesaiState();
}

class _SelesaiState extends State<Selesai> {
  @override
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    // var duration =
    //   const Duration(seconds: 2);
    // return Timer(duration, () {
    //   Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomeWidget()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF2F9DF5),
        elevation: 0,
        title: Text(
          "Selesai",
          style: TextStyle(color: Colors.white),
          //fontWeight: FontWeight.bold, color: Color(0xFFF9683A),
        ),
        //leading: Container(),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/images/logo.png", // Ubah ukuran gambar di sini
                  ),
                ),
              ),
              SizedBox(height: 80),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/images/thank.png",
                    width: 300, // Ubah ukuran gambar di sini
                    height: 200, // Ubah ukuran gambar di sini
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Telah Menggunakan Jasa Layanan Kami',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.popAndPushNamed(context, 'menu',
                        arguments: widget.customer.id);
                  },
                  child: Text('Kembali ke halaman utama'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.white),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
