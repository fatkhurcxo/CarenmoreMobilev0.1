import 'package:flutter/material.dart';
import 'package:tugasakhir/user/order.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0xFF2F9DF5),
        centerTitle: true,
        
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // List
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  // Body List
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 350,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF2F9DF5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // Isi Dalam List
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //  Nama Pemesan
                                children: [
                                  Text(
                                    'Agil cs.',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Alamat
                                  SizedBox(height: 0),
                                  Text(
                                    'Jl.AYani no.5864',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  // Tanggal dan Icon Button
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    // Tanggal
                                    children: [
                                      Text(
                                        '08134567890',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Icon Button
                                      IconButton(
                                        icon: Icon(
                                          Icons.add_to_photos,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        onPressed: () async {
                                          Navigator.pushNamed(context, 'editdata');
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: 550,
                    decoration: BoxDecoration(),
                    // Text Selamat Datang
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return OrderWidget();
                                        }));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/images/motor.png"),
                                        Text(
                                          "Cuci Motor",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        )
                                      ]),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(5),
                                      backgroundColor: Color(0xFFFFFFFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                      elevation: 0),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return OrderWidget();
                                        }));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/images/mobil.png"),
                                        Text(
                                          "Cuci Mobil",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        )
                                      ]),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(5),
                                      backgroundColor: Color(0xFFFFFFFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                      elevation: 0),
                                  ),
                                ],
                              ),
                            ),
                            // button 2
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}