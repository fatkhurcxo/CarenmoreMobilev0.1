import 'package:flutter/material.dart';
import 'package:tugasakhir/models/motor.dart';
import 'package:tugasakhir/screen/detailmotor.dart';
import 'package:tugasakhir/services/mtrservice.dart';

class Layananmtr extends StatefulWidget {
  const Layananmtr({Key? key}) : super(key: key);

  @override
  _LayananmtrState createState() => _LayananmtrState();
}

class _LayananmtrState extends State<Layananmtr> {
  List<Motor> listMotor = [];
  /* the service */
  Mtrservice mblservice = Mtrservice();

  getData() async {
    listMotor = await mblservice.fetchMotor();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(listMotor);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih layanan cuci motor'),
      ),
      body: ListView.builder(
          itemCount: listMotor.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detailmotor(
                              motor: listMotor[index],
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
                          "assets/images/motor.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listMotor[index].nama,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.blueAccent)),
                        Text('lokasi : ${listMotor[index].jenis}'),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('HTM : ${listMotor[index].harga}'),
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
