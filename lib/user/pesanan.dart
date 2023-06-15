import 'package:flutter/material.dart';
import 'package:tugasakhir/screen/selesai.dart';
import 'dart:async';

class Pesanan extends StatefulWidget {
  const Pesanan({Key? key}) : super(key: key);

  @override
  _PesananState createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
 // Change this value as needed

  @override
  void initState() {
    super.initState();
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
          "Pesanan",
          style: TextStyle(color: Colors.white),
              //fontWeight: FontWeight.bold, color: Color(0xFFF9683A),
        ),
        //leading: Container(),
      ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Theme.of(context).textTheme.bodyText1!.color!,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text(
                            'Pembayaran Anda Telah Berhasil',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Text(
                            'Mohon Tunggu KaryawanKami Sedang Menuju Alamat Anda',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Theme.of(context).textTheme.bodyText1!.color!,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                child: Text(
                                  'Status Pembayaran',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
                                child: Text(
                                  'Menunggu',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Repeat the above row widget as needed

                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                child: Text(
                                  'Status Pembayaran',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
                                child: Text(
                                  'Menunggu',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                child: Text(
                                  'Status Pembayaran',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
                                child: Text(
                                  'Menunggu',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                child: Text(
                                  'Status Pembayaran',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
                                child: Text(
                                  'Menunggu',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                child: Text(
                                  'Status Pembayaran',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
                                child: Text(
                                  'Menunggu',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                child: Text(
                                  'Status Pembayaran',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
                                child: Text(
                                  'Menunggu',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Theme.of(context).textTheme.bodyText1!.color!,
                          offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          'Klik Selesaikan Pesanan Ketika Pegawai Telah Selesai Membersihkan Kendaraan Anda',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Selesai(
                              )));
                  },
                  child: Text('Selesaikan Pesanan'),
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
      );
  }
}
