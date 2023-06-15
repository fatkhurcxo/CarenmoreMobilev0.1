import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tugasakhir/services/cservice.dart';
import 'package:tugasakhir/user/layananmbl.dart';
import 'package:tugasakhir/user/order.dart';
import 'package:tugasakhir/user/pesanan.dart';
import '../models/customer.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  /* the customer model */
  late Future<Customer> futureCustomer;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  final List<String> imageList = [
    'assets/images/gambar1.jpg',
    'assets/images/gambar2.jpg',
    'assets/images/gambar3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final customerId = ModalRoute.of(context)?.settings.arguments as int;
    /* get value customer ID */
    futureCustomer = Cservice.fetchCustomer(customerId);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Carenmore'),
          leading: Container(),
          backgroundColor: Color(0xFF2F9DF5),
          centerTitle: false,
        ),
        body: SafeArea(
            child: FutureBuilder(
          future: futureCustomer,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  // List
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        // Body List
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                                    color: const Color(0xFF2F9DF5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // Isi Dalam List
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 3.0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      //  Nama Pemesan
                                      children: [
                                        Text(
                                          snapshot.data!.nama +
                                              " ( Id: $customerId )",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        // Alamat
                                        SizedBox(height: 0),
                                        Text(
                                          /*  */
                                          snapshot.data!.alamat,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        // Tanggal dan Icon Button
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // Tanggal
                                          children: [
                                            Text(
                                              'Customer Status: ${snapshot.data!.status}',
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // Icon Button
                                            IconButton(
                                              icon: const Icon(
                                                Icons.edit_note_rounded,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                              onPressed: () async {
                                                Navigator.pushNamed(
                                                    context, 'editdata');
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
                        SizedBox(
                          height: 25,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.width * 0.5,
                            autoPlay: true,
                            aspectRatio: 3.0,
                            enlargeCenterPage: true,
                          ),
                          items: imageList.map((imageUrl) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25.0),
                          height: 550,
                          decoration: const BoxDecoration(),
                          // Text Selamat Datang
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 0,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, 'layananmtr');
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) {
                                          //   return OrderWidget();
                                          // }));
                                        },
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/motor.png"),
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
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 0),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          print(snapshot.data);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MobilLayanan(
                                                        customer:
                                                            snapshot.data!),
                                              ));
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) {
                                          //   return OrderWidget();
                                          // }));
                                        },
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/mobil.png"),
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
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator.adaptive();
            // return Center(
            //   child: const CircularProgressIndicator(),
            // );
          },
        )));
  }
}
