class CardCustomer {
  String id;
  String nama;
  String produk_pembelian;
  String no_telp;
  String pembayaran;
  DateTime tanggal;
  String data;


  CardCustomer({this.id, this.nama, this.produk_pembelian,this.no_telp,this.pembayaran,
      this.tanggal, this.data});

  factory CardCustomer.fromJson(Map<String, dynamic> json){
    return CardCustomer(
      id: json['id'],
      nama: json['nama'],
      produk_pembelian: json['produk_pembelian'],
      no_telp: json['no_telp'],
      pembayaran: json['pembayaran'],
      tanggal: json['tanggal']== null ? null : DateTime.parse(json['tanggal']),
      data: json['data'],
    );
  }
}