class Transaksi {
  final int id;
  final int layananId;
  final int providerId;
  final int customerId;
  final int berlangganan;
  final String reference;
  final String pembayaran;
  final String status;
  final int nominal;

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
