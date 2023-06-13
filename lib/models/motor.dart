class Motor {
  final int id;
  final String providerId,
      nama,
      kendaraan,
      tempat,
      air,
      jenis,
      harga,
      deskripsi;

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
