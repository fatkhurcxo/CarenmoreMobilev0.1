class Customer {
  final String message;
  final String alamat;
  final String nama;
  final String coin;
  final String status;
  final int id;

  const Customer(
      {required this.id,
      required this.alamat,
      required this.nama,
      required this.coin,
      required this.status,
      required this.message});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        id: json['id'],
        alamat: json['alamat'],
        nama: json['nama'],
        coin: json['coin'],
        status: json['status'],
        message: json['message']);
  }
}
