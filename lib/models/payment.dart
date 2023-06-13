class Payment {
  final String reference;
  final String pembayaran;
  final String status;
  final int? nominal;
  final String? dibuat;
  final String checkoutUrl;
  // final String harga, code, nama;

  Payment(
      {required this.reference,
      required this.pembayaran,
      required this.status,
      required this.dibuat,
      required this.nominal,
      required this.checkoutUrl});

  // factory Payment.fromJson(Map<String, dynamic> json) {
  //   return Payment(
  //       harga: json['harga'], code: json['code'], nama: json['nama']);
  // }
}
