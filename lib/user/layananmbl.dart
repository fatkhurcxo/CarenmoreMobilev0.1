import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/models/customer.dart';
import 'package:tugasakhir/models/mobil.dart';
import 'package:tugasakhir/screen/detailmobil.dart';
import 'package:tugasakhir/services/mblservice.dart';

class MobilLayanan extends StatefulWidget {
  const MobilLayanan({Key? key, required this.customer}) : super(key: key);
  final Customer customer;

  @override
  State<MobilLayanan> createState() => _MobilLayananState();
}

class _MobilLayananState extends State<MobilLayanan> {
  /* the model of layanan mobil */
  List<Mobil> listMobil = [];
  /* the service */
  Mblservice mblservice = Mblservice();

  /* test print customer */

  getData() async {
    listMobil = await mblservice.fetchMobil();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.customer.alamat);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih layanan cuci mobil'),
      ),
      body: ListView.builder(
          itemCount: listMobil.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailMobil(
                              mobil: listMobil[index],
                              customer: widget.customer,
                            )));
              },
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/mobil.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listMobil[index].nama,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.blueAccent)),
                        Text('lokasi : ${listMobil[index].jenis}'),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('HTM : ${listMobil[index].harga}'),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
