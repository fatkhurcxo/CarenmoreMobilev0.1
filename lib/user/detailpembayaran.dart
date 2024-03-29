import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/models/customer.dart';
import 'package:tugasakhir/models/mobil.dart';
import 'package:tugasakhir/models/payment.dart';
import 'package:tugasakhir/models/transaksi.dart';
import 'package:tugasakhir/services/trcservice.dart';
import 'package:tugasakhir/user/pesanan.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailpesanan extends StatefulWidget {
  const Detailpesanan(
      {super.key,
      required this.customer,
      required this.mobil,
      required this.payment});
  final Customer customer;
  final Mobil mobil;
  final Payment payment;

  @override
  State<Detailpesanan> createState() => _DetailpesananState();
}

class _DetailpesananState extends State<Detailpesanan> {
  TextEditingController datetimeinput = TextEditingController();

  TransaksiService getDetailsTransaksi = TransaksiService();
  late Future<Transaksi> detailData;

  _launchURL() async {
    final Uri url = Uri.parse(widget.payment.checkoutUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    datetimeinput.text = "";
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
          "Detail Pembayaran",
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
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
              child: Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Theme.of(context).textTheme.bodyText1!.color!,
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/mobil.png',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.mobil.nama,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Text(
                                    widget.mobil.kendaraan,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ),
                              Text(
                                'Rp.  ${widget.mobil.harga}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0.1),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              'Status Pesanan',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(60, 10, 0, 0),
                            child: Text(
                              widget.payment.status,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0.1),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              'Status Pembayaran',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 10, 0, 0),
                            child: Text(
                              widget.payment.pembayaran,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0.1),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              'No. Reference',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(70, 10, 0, 0),
                            child: Text(
                              widget.payment.reference,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Poppins',
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
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Theme.of(context).textTheme.bodyText1!.color!,
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        'Alamat : ',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            widget.customer.alamat,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
              child: ElevatedButton(
                onPressed: _launchURL,
                child: Text(
                  'Lakukan Pembayaran',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(88, 40),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  primary: Theme.of(context).primaryColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () async {
                  Transaksi response = await getDetailsTransaksi
                      .getDetailTransaksi(widget.payment.reference);

                  print(response.pembayaran);

                  if (response.pembayaran == 'unpaid') {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 2), () {
                            // Navigator.of(context).pop(true);
                          });
                          return AlertDialog(
                            title: Text("Anda belum melakukan pembayaran"),
                          );
                        });
                  } else if (response.pembayaran == 'paid') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pesanan(
                              transaksi: response, customer: widget.customer),
                        ));

                    showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(context).pop(true);
                        });
                        return AlertDialog(
                          content: Text(
                            'Pembayaran anda berhasil diverifikasi',
                            style: TextStyle(color: Colors.green),
                            textAlign: TextAlign.center,
                          ),
                          // backgroundColor: Colors.blue.withOpacity(0.7),
                          icon: Icon(Icons.check_circle_outline_rounded,
                              color: Colors.green),
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'Check Status',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(88, 40),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  primary: Theme.of(context).primaryColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
