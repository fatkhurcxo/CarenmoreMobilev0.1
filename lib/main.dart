import 'package:flutter/material.dart';
/* the provider */
// import 'package:provider/provider.dart';
// import 'package:tugasakhir/screen/detailmobil.dart';
// import 'package:tugasakhir/user/layananmbl.dart';
/* pages */
import 'package:tugasakhir/screen/login.dart';
import 'package:tugasakhir/screen/register.dart';
import 'package:tugasakhir/screen/splashscreen.dart';
// import 'package:tugasakhir/screen/selesai.dart';
import 'package:tugasakhir/user/home.dart';
import 'package:tugasakhir/user/editdata.dart';
import 'package:tugasakhir/user/layananmtr.dart';
// import 'package:tugasakhir/user/order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'register': (context) => const RegisterWidget(),
        'login': (context) => const LoginWidget(),
        'menu': (context) => const HomeWidget(),
        'editdata': (context) => const EditdataWidget(),
        // 'order': (context) => OrderWidget(),
        // 'pesanan': (context) => const Pesanan(),
        // 'selesai': (context) => const Selesai(),
        // 'layananmbl': (context) => const MobilLayanan(),
        'layananmtr': (context) => const Layananmtr(),
      },
      debugShowCheckedModeBanner: false,
      title: 'tugas akhir',
      home: const SplashScreen(),
    );
  }
}
