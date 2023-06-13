import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Transaksi {
  Future makePayment() async {
    try {
      final response = await http.post(Uri.parse("h"));
    } catch (e) {
      print(e.toString());
    }
  }
}
