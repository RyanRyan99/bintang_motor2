import 'dart:convert';

class AlbumProdManual{
  String id;
  String tipe_mesin;
  String kapasitas_mesin;
  String sistem_suplai_bahan_bakar;
  String diameterXlangkah;
  String tipe_transmisi;
  String rasio_komperasi;
  String daya_maksimum;
  String torsi_maksimum;
  String tipe_starter;
  String tipe_kopling;
  String tipe_rangka;
  String tipe_suspensi_depan;
  String tipe_suspensi_belakang;
  String sistem_pendingin_mesin;
  String pola_perpindahan_gigi;
  String ukuran_ban_depan;
  String ukuran_ban_belakang;
  String rem_depan;
  String rem_belakang;
  String sistem_pengereman;
  String panjangXlebarXtinggi;
  String tinggi_tempat_duduk;
  String jarak_sumbu_roda;
  String jarak_terendah_ketanah;
  String curb_weight;
  String kapasitas_tangki;
  String kapasitas_minyak_pelumas;
  String tipe_baterai_aki;
  String sistem_pengapian;
  String tipe_busi;
  String lampu_depan;
  String image;
  String image_2;
  String image_3;

  AlbumProdManual({
    this.id,
    this.tipe_mesin,
    this.kapasitas_mesin,
    this.sistem_suplai_bahan_bakar,
    this.diameterXlangkah,
    this.tipe_transmisi,
    this.rasio_komperasi,
    this.daya_maksimum,
    this.torsi_maksimum,
    this.tipe_starter,
    this.tipe_kopling,
    this.tipe_rangka,
    this.tipe_suspensi_depan,
    this.tipe_suspensi_belakang,
    this.sistem_pendingin_mesin,
    this.pola_perpindahan_gigi,
    this.ukuran_ban_depan,
    this.ukuran_ban_belakang,
    this.rem_depan,
    this.rem_belakang,
    this.sistem_pengereman,
    this.panjangXlebarXtinggi,
    this.tinggi_tempat_duduk,
    this.jarak_sumbu_roda,
    this.jarak_terendah_ketanah,
    this.curb_weight,
    this.kapasitas_tangki,
    this.kapasitas_minyak_pelumas,
    this.tipe_baterai_aki,
    this.sistem_pengapian,
    this.tipe_busi,
    this.lampu_depan,
    this.image,
    this.image_2,
    this.image_3,
  });
  factory AlbumProdManual.fromJson(Map<String, dynamic> json){
    return AlbumProdManual(
        id: json['id'],
        tipe_mesin: json['tipe_mesin'],
        kapasitas_mesin: json['kapasitas_mesin'],
        sistem_suplai_bahan_bakar: json['sistem_suplai_bahan_bakar'],
        diameterXlangkah: json['diameterXlangkah'] as String,
        tipe_transmisi: json['tipe_transmisi'] as String,
        rasio_komperasi: json['rasio_kompresi'] as String,
        daya_maksimum: json['daya_maksimum'],
        torsi_maksimum: json['torsi_maksimum'],
        tipe_starter: json['tipe_starter'],
        tipe_kopling: json['tipe_kopling'],
        tipe_rangka: json['tipe_rangka'],
        tipe_suspensi_depan: json['tipe_suspensi_depan'],
        tipe_suspensi_belakang: json['tipe_suspensi_belakang'],
        sistem_pendingin_mesin: json['sistem_pendingin_mesin'],
        pola_perpindahan_gigi: json['pola_perpindahan_gigi'],
        ukuran_ban_depan: json['ukuran_ban_depan'],
        ukuran_ban_belakang: json['ukuran_ban_belakang'],
        rem_depan: json['rem_depan'],
        rem_belakang: json['rem_belakang'],
        sistem_pengereman: json['sistem_pengereman'],
        panjangXlebarXtinggi: json['panjangXlebarXtinggi'] as String,
        tinggi_tempat_duduk: json['tinggi_tempat_duduk'],
        jarak_sumbu_roda: json['jarak_sumbu_roda'],
        jarak_terendah_ketanah: json['jarak_terendah_ketanah'],
        curb_weight: json['curb_weight'],
        kapasitas_tangki: json['kapasitas_tangki'],
        kapasitas_minyak_pelumas: json['kapasitas_minyak_pelumas'],
        tipe_baterai_aki: json['tipe_baterai_aki'] as String,
        sistem_pengapian: json['sistem_pengapian'],
        tipe_busi: json['tipe_busi'],
        lampu_depan: json['lampu_depan'],
        image: json['image'],
        image_2: json['image_2'],
        image_3: json['image_3']
    );
  }
}

class AlbumProdMatic {
  String id;
  String tipe_mesin;
  String volume_langkah;
  String sistem_suplai_bahan_bakar;
  String diameterXlangkah;
  String tipe_transmisi;
  String rasio_kompresi;
  String daya_maksimum;
  String torsi_maksimum;
  String tipe_starter;
  String tipe_kopling;
  String sistem_pendingin_mesin;
  String tipe_rangka;
  String tipe_suspensi_depan;
  String tipe_suspensi_belakang;
  String ukuran_ban_depan;
  String ukuran_ban_belakang;
  String rem_depan;
  String rem_belakang;
  String sistem_pengereman;
  String panjangXlebarXtinggi;
  String tinggi_tempat_duduk;
  String jarak_sumbu_roda;
  String jarak_terendah_ketanah;
  String curb_weight;
  String kapasitas_tangki;
  String kapasitas_minyak_pelumas;
  String tipe_baterai_aki;
  String sistem_pengapian;
  String tipe_busi;
  String lampu_depan;
  String image;
  String image_2;
  String image_3;


  AlbumProdMatic({this.id, this.tipe_mesin, this.volume_langkah,
      this.sistem_suplai_bahan_bakar, this.diameterXlangkah,
      this.tipe_transmisi, this.rasio_kompresi, this.daya_maksimum,
      this.torsi_maksimum, this.tipe_starter, this.tipe_kopling,
      this.sistem_pendingin_mesin, this.tipe_rangka, this.tipe_suspensi_depan,
      this.tipe_suspensi_belakang, this.ukuran_ban_depan,
      this.ukuran_ban_belakang, this.rem_depan, this.rem_belakang,
      this.sistem_pengereman, this.panjangXlebarXtinggi,
      this.tinggi_tempat_duduk, this.jarak_sumbu_roda,
      this.jarak_terendah_ketanah, this.curb_weight, this.kapasitas_tangki,
      this.kapasitas_minyak_pelumas, this.tipe_baterai_aki,
      this.sistem_pengapian, this.tipe_busi, this.lampu_depan, this.image,
      this.image_2, this.image_3});

  factory AlbumProdMatic.fromJson(Map<String, dynamic> json){
      return AlbumProdMatic(
        id: json['id'],
        tipe_mesin: json['tipe_mesin'],
        volume_langkah: json['volume_langkah'],
        sistem_suplai_bahan_bakar: json['sistem_suplai_bahan_bakar'],
        diameterXlangkah: json['diameterXlangkah'],
        tipe_transmisi: json['tipe_transmisi'],
        rasio_kompresi: json['rasio_kompresi'],
        daya_maksimum: json['daya_maksimum'],
        torsi_maksimum: json['torsi_maksimum'],
        tipe_starter: json['tipe_starter'],
        tipe_kopling: json['tipe_kopling'],
        sistem_pendingin_mesin: json['sistem_pendingin_mesin'],
        tipe_rangka: json['tipe_rangka'],
        tipe_suspensi_depan: json['tipe_suspensi_depan'],
        tipe_suspensi_belakang: json['tipe_suspensi_belakang'],
        ukuran_ban_depan: json['ukuran_ban_depan'],
        ukuran_ban_belakang: json['ukuran_ban_belakang'],
        rem_depan: json['rem_depan'],
        rem_belakang: json['rem_belakang'],
        sistem_pengereman: json['sistem_pengereman'],
        panjangXlebarXtinggi: json['panjangXlebarXtinggi'],
        tinggi_tempat_duduk: json['tinggi_tempat_duduk'],
        jarak_sumbu_roda: json['jarak_sumbu_roda'],
        jarak_terendah_ketanah: json['jarak_terendah_ketanah'],
        curb_weight: json['curb_weight'],
        kapasitas_tangki: json['kapasitas_tangki'],
        kapasitas_minyak_pelumas: json['kapasitas_minyak_pelumas'],
        tipe_baterai_aki: json['tipe_baterai_aki'],
        sistem_pengapian: json['sistem_pengapian'],
        tipe_busi: json['tipe_busi'],
        lampu_depan: json['lampu_depan'] as String,
        image: json['image'],
        image_2: json['image_2'],
        image_3: json['image_3'],
      );
    }
}

class AlbumProdCub {
  String id;
  String tipe_mesin;
  String sistem_suplai_bahan_bakar;
  String diameterXlangkah;
  String tipe_transmisi;
  String rasio_kompresi;
  String daya_maksimum;
  String torsi_maksimum;
  String tipe_starter;
  String tipe_kopling;
  String tipe_pendinginan;
  String tipe_rangka;
  String tipe_suspensi_depan;
  String tipe_suspensi_belakang;
  String ukuran_ban_depan;
  String ukuran_ban_belakang;
  String rem_depan;
  String rem_belakang;
  String sistem_pengereman;
  String panjangXlebarXtinggi;
  String tinggi_tempat_duduk;
  String jarak_sumbu_roda;
  String jarak_terendah_ketanah;
  String curb_weight;
  String kapasitas_tangki_bahan_bakar;
  String kapasitas_minyak_pelumas;
  String tipe_baterai_aki;
  String sistem_pengapian;
  String tipe_busi;
  String lampu_depan;
  String image;
  String image_2;
  String image_3;

  AlbumProdCub({this.id, this.tipe_mesin, this.sistem_suplai_bahan_bakar,
      this.diameterXlangkah, this.tipe_transmisi, this.rasio_kompresi,
      this.daya_maksimum, this.torsi_maksimum, this.tipe_starter,
      this.tipe_kopling, this.tipe_pendinginan, this.tipe_rangka,
      this.tipe_suspensi_depan, this.tipe_suspensi_belakang,
      this.ukuran_ban_depan, this.ukuran_ban_belakang, this.rem_depan,
      this.rem_belakang, this.sistem_pengereman, this.panjangXlebarXtinggi,
      this.tinggi_tempat_duduk, this.jarak_sumbu_roda,
      this.jarak_terendah_ketanah, this.curb_weight,
      this.kapasitas_tangki_bahan_bakar, this.kapasitas_minyak_pelumas,
      this.tipe_baterai_aki, this.sistem_pengapian, this.tipe_busi,
      this.lampu_depan, this.image, this.image_2, this.image_3});

  factory AlbumProdCub.fromJson(Map<String, dynamic> json){
    return AlbumProdCub(
      id: json['id'],
      tipe_mesin: json['tipe_mesin'],
      sistem_suplai_bahan_bakar: json['sistem_suplai_bahan_bakar'],
      diameterXlangkah: json['diameterXlangkah'],
      tipe_transmisi: json['tipe_transmisi'] as String,
      rasio_kompresi: json['rasio_kompresi'],
      daya_maksimum: json['daya_maksimum'],
      torsi_maksimum: json['torsi_maksimum'],
      tipe_starter: json['tipe_starter'],
      tipe_kopling: json['tipe_kopling'],
      tipe_pendinginan: json['tipe_pendinginan'],
      tipe_rangka: json['tipe_rangka'],
      tipe_suspensi_depan: json['tipe_suspensi_depan'],
      tipe_suspensi_belakang: json['tipe_suspensi_belakang'],
      ukuran_ban_depan: json['ukuran_ban_depan'] as String,
      ukuran_ban_belakang: json['ukuran_ban_belakang'],
      rem_depan: json['rem_depan'],
      rem_belakang: json['rem_belakang'],
      sistem_pengereman: json['sistem_pengereman'],
      panjangXlebarXtinggi: json['panjangXlebarXtinggi'],
      tinggi_tempat_duduk: json['tinggi_tempat_duduk'],
      jarak_sumbu_roda: json['jarak_sumbu_roda'],
      jarak_terendah_ketanah: json['jarak_terendah_ketanah'],
      curb_weight: json['curb_weight'],
      kapasitas_tangki_bahan_bakar: json['kapasitas_tangki_bahan_bakar'],
      kapasitas_minyak_pelumas: json['kapasitas_minyak_pelumas'],
      tipe_baterai_aki: json['tipe_baterai_aki'],
      sistem_pengapian: json['sistem_pengapian'],
      tipe_busi: json['tipe_busi'],
      lampu_depan: json['lampu_depan'],
      image: json['image'],
      image_2: json['image_2'],
      image_3: json['image_3'],
    );
  }
}























