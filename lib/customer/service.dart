class CardCustomer {
  String id;
  String nama;
  String produk_pembelian;
  String pembayaran;
  String tanggal;
  String data;

  CardCustomer({this.id, this.nama, this.produk_pembelian, this.pembayaran,
      this.tanggal, this.data});

  factory CardCustomer.fromJson(Map<String, dynamic> json){
    return CardCustomer(
      id: json['id'],
      nama: json['nama'],
      produk_pembelian: json['produk_pembelian'],
      pembayaran: json['pembayaran'],
      tanggal: json['tanggal'],
      data: json['data'],
    );
  }
}