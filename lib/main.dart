import 'package:flutter/material.dart';
/* the provider */
import 'package:provider/provider.dart';
import 'package:tugasakhir/providers/auth.dart';
import 'package:tugasakhir/providers/customer.dart';
/* pages */
import 'package:tugasakhir/screen/login.dart';
import 'package:tugasakhir/screen/register.dart';
import 'package:tugasakhir/screen/splashscreen.dart';
import 'package:tugasakhir/screen/selesai.dart';
import 'package:tugasakhir/user/home.dart';
import 'package:tugasakhir/user/editdata.dart';
import 'package:tugasakhir/user/order.dart';
import 'package:tugasakhir/user/Pesanan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        routes: {
          'register': (context) => RegisterWidget(),
          'login': (context) => LoginWidget(),
          'menu': (context) => HomeWidget(),
          'editdata': (context) => EditdataWidget(),
          'order': (context) => OrderWidget(),
          'pesanan': (context) => Pesanan(),
          'selesai': (context) => Selesai(),
        },
        debugShowCheckedModeBanner: false,
        title: 'tugas akhir',
        home: SplashScreen(),
      ),
    );
  }
}
