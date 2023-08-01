class Motor {
  final int id;
  final int providerId;
  final String nama;
  final String kendaraan;
  final int tempat;
  final int air;
  final String jenis;
  final int harga;
  final String deskripsi;

  Motor({
    required this.id,
    required this.providerId,
    required this.nama,
    required this.kendaraan,
    required this.tempat,
    required this.air,
    required this.jenis,
    required this.harga,
    required this.deskripsi,
  });

  factory Motor.fromJson(Map<String, dynamic> json) {
    return Motor(
        id: json['id'],
        providerId: json['provider_id'],
        nama: json['nama'],
        kendaraan: json['kendaraan'],
        tempat: json['tempat'],
        air: json['air'],
        jenis: json['jenis'],
        harga: json['harga'],
        deskripsi: json['deskripsi']);
  }
}
