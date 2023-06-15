import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Detailmotor extends StatefulWidget {
  const Detailmotor({Key? key, required this.motor}) : super(key: key);
  final motor;

  @override
  _DetailmotorState createState() => _DetailmotorState();
}

class _DetailmotorState extends State<Detailmotor> {
  late Future<List<String>> futurePayment;
  List listPayment = [];

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
    print(listPayment);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Layanan"),
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
          SizedBox(
            height: 16,
          ),
          Text(
            "${widget.motor.nama}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.blueAccent),
          ),
          Text('Harga: ${widget.motor.harga}'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Description : ${widget.motor.deskripsi}',
              maxLines: 15,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.brown,
              ),
            ),
          ),
          Padding(
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
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                hint: Text('Pilih metode pembayaran'),
                items: listPayment.map((item) {
                  print(item['code']);
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
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => OrderWidget(
                //               mobil: widget.mobil,
                //             )));
              },
              child: Text("Pesan Sekarang"))
        ],
      ),
    );
  }
}
