class Transaksi {
  final int id;
  final String layananId;
  final String providerId;
  final String customerId;
  final String berlangganan;
  final String reference;
  final String pembayaran;
  final String status;
  final String nominal;

  Transaksi(
      {required this.id,
      required this.layananId,
      required this.providerId,
      required this.customerId,
      required this.berlangganan,
      required this.reference,
      required this.pembayaran,
      required this.status,
      required this.nominal});
}
