import 'package:bintang_motor/information/produk_backend/getdata-prod.dart';
import 'package:bintang_motor/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
  final AlbumProdManual curAlbum;
  DetailProduk({@required this.curAlbum});
  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _Logo(),
          Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child: Container(
              height: 550,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  _PictureDetail(),
                  Padding(
                    padding: const EdgeInsets.only(top: 225, left: 10),
                    child: new Text("Spesifikasi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.red
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 250, right: 10, left: 10),
                    child: Container(
                      height: double.infinity,
                      child: Stack(
                        children: <Widget>[
                          _Tabs()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _Logo(){
    return Stack(
      children: <Widget>[
        Container(
          child: Container(
            color: Colors.white70,
          ),
          width: double.infinity,
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background2.png"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Container(
          height: 130.0,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              )
          ),
          child: new Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Logo.png")
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 105, left: 20),
                child: Container(
                  child: Text("Detail Produk",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget _PictureDetail(){
    return Stack(
      children: <Widget>[
        Container(
          height: 130, width: double.infinity,
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.curAlbum.image),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 110, left: 17),
          child: Container(
            height: 100,
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      _CardMotor(image: widget.curAlbum.image),
                      _CardMotor(image: widget.curAlbum.image_2),
                      _CardMotor(image: widget.curAlbum.image_3),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget _CardMotor({image}){
    return Card(
      elevation: 0,
      child: Container(
        height: 100, width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
  Widget _Tabs(){
    return Container(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: Menu(),
          body: TabBarView(
            children: [
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Mesin()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Rangka()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _DimensiBerat()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Kapasitas()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Kelistrikan()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget Menu(){
    return Container(
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.red,
        indicatorColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: Colors.red,
        ),
        tabs: <Widget>[
          Tab(child: Text("Mesin",style: TextStyle(fontSize: 10))),
          Tab(child: Text("Rangka & Kaki Kaki", style: TextStyle(fontSize: 10))),
          Tab(child: Text("Dimensi & Berat", style: TextStyle(fontSize: 10),),),
          Tab(child: Text("Kapasitas", style: TextStyle(fontSize: 10),),),
          Tab(child: Text("Kelistrikan", style: TextStyle(fontSize: 9.5),),),
        ],
      ),
    );
  }
  Widget _Mesin(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Mesin", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_mesin, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sistem Suplai Bahan Bakar", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.sistem_suplai_bahan_bakar, style: TextStyle(color: Colors.white, fontSize: 11))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Diameter X langkah", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.diameterXlangkah, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
           Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text("Tipe Transmisi", style: TextStyle(color: Colors.white, fontSize: 11),),
                 Text(widget.curAlbum.tipe_transmisi, style: TextStyle(color: Colors.white, fontSize: 11),)
               ],
             ),
           ),
           Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text("Rasio Kompresi", style: TextStyle(color: Colors.white, fontSize: 11),),
                 Text(widget.curAlbum.rasio_komperasi, style: TextStyle(color: Colors.white, fontSize: 11),)
               ],
             ),
           ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Daya Maksimum", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.daya_maksimum, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Torsi Maksimum", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.torsi_maksimum,  style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Starter", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_starter, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Kopling", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_kopling, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _Rangka(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sistem Pendingin Mesin", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.sistem_pendingin_mesin, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Pola Perpindahan Gigi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.pola_perpindahan_gigi, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Rangka", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_rangka, style: TextStyle(color: Colors.white, fontSize: 11),),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Suspensi Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_suspensi_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Suspensi Belakang", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_suspensi_belakang, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Ukuran Ban Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.ukuran_ban_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Ukuran Ban Belakang", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.ukuran_ban_belakang, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Rem Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.rem_depan, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Rem Belakang", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.rem_belakang, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _DimensiBerat(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Panjang X Lebar X Tinggi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.panjangXlebarXtinggi.toString(), style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tinggi Tempat Duduk", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tinggi_tempat_duduk.toString(),  style: TextStyle(color: Colors.white, fontSize: 11),),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Jarak Sumbu Roda", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.jarak_sumbu_roda.toString(), style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Jarak Terendah Ketanah", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.jarak_terendah_ketanah.toString(), style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _Kapasitas(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Curb Weight", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.curb_weight, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Kapasitas Tangki Bahan Bakar", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.kapasitas_tangki, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Kapasitas Minyak Pelumas", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.kapasitas_minyak_pelumas, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _Kelistrikan(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Baterai atau Aki", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_baterai_aki, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sistem Pengapian", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.sistem_pengapian, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Busi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_busi, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Class DetailProdukMatic
class DetailProdukMt extends StatefulWidget {
  final AlbumProdMatic curAlbum;
  DetailProdukMt({this.curAlbum});
  @override
  _DetailProdukMtState createState() => _DetailProdukMtState();
}

class _DetailProdukMtState extends State<DetailProdukMt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          _Logo(),
          Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child: Container(
              height: 550,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  _PictureDetail(),
                  Padding(
                    padding: const EdgeInsets.only(top: 225, left: 10),
                    child: new Text("Spesifikasi",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 250, right: 10, left: 10),
                    child: Container(
                      height: double.infinity,
                      child: Stack(
                        children: <Widget>[
                          _Tabs()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _Logo(){
    return Stack(
      children: <Widget>[
        Container(
          child: Container(
            color: Colors.white70,
          ),
          width: double.infinity,
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background2.png"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Container(
          height: 130.0,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              )
          ),
          child: new Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Logo.png")
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 105, left: 20),
                child: Container(
                  child: Text("Detail Produk",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget _CardMotor({image}){
    return Card(
      elevation: 0,
      child: Container(
        height: 100, width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }
  Widget _PictureDetail(){
    return Stack(
      children: <Widget>[
        Container(
          height: 130, width: double.infinity,
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.curAlbum.image),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 110, left: 17),
          child: Container(
            height: 100,
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      _CardMotor(image: widget.curAlbum.image),
                      _CardMotor(image: widget.curAlbum.image_2),
                      _CardMotor(image: widget.curAlbum.image_3),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget _Tabs(){
    return Container(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: Menu(),
          body: TabBarView(
            children: [
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Mesin()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Rangka()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _DimensiBerat()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Kapasitas()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Kelistrikan()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget Menu(){
    return Container(
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.red,
        indicatorColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: Colors.red,
        ),
        tabs: <Widget>[
          Tab(child: Text("Mesin",style: TextStyle(fontSize: 10))),
          Tab(child: Text("Rangka & Kaki Kaki", style: TextStyle(fontSize: 10))),
          Tab(child: Text("Dimensi & Berat", style: TextStyle(fontSize: 10),),),
          Tab(child: Text("Kapasitas", style: TextStyle(fontSize: 10),),),
          Tab(child: Text("Kelistrikan", style: TextStyle(fontSize: 9.5),),),
        ],
      ),
    );
  }
  Widget _Mesin(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Mesin", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_mesin, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sistem Suplai Bahan Bakar", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.sistem_suplai_bahan_bakar, style: TextStyle(color: Colors.white, fontSize: 11))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Diameter X langkah", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.diameterXlangkah, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Transmisi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_transmisi, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Rasio Kompresi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.rasio_kompresi, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Daya Maksimum", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.daya_maksimum, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Torsi Maksimum", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.torsi_maksimum,  style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Starter", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_starter, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Kopling", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_kopling, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _Rangka(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sistem Pendingin Mesin", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.sistem_pendingin_mesin, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Rangka", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_rangka, style: TextStyle(color: Colors.white, fontSize: 11),),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Suspensi Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_suspensi_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Suspensi Belakang", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_suspensi_belakang, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Ukuran Ban Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.ukuran_ban_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Ukuran Ban Belakang", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.ukuran_ban_belakang, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Rem Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.rem_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Rem Belakang", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.rem_belakang, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _DimensiBerat(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Panjang X Lebar X Tinggi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.panjangXlebarXtinggi.toString(), style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tinggi Tempat Duduk", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tinggi_tempat_duduk.toString(),  style: TextStyle(color: Colors.white, fontSize: 11),),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Jarak Sumbu Roda", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.jarak_sumbu_roda.toString(), style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Jarak Terendah Ketanah", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.jarak_terendah_ketanah.toString(), style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _Kapasitas(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Curb Weight", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.curb_weight, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Kapasitas Tangki Bahan Bakar", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.kapasitas_tangki, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Kapasitas Minyak Pelumas", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.kapasitas_minyak_pelumas, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _Kelistrikan(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Baterai atau Aki", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_baterai_aki, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sistem Pengapian", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.sistem_pengapian, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Busi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_busi, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Lampu Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.lampu_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//Class DetailProdukCub
class DetailProdukCub extends StatefulWidget {
  final AlbumProdCub curAlbum;
  DetailProdukCub({this.curAlbum});
  @override
  _DetailProdukCubState createState() => _DetailProdukCubState();
}

class _DetailProdukCubState extends State<DetailProdukCub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          _Logo(),
          Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child: Container(
              height: 550,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  _PictureDetail(),
                  Padding(
                    padding: const EdgeInsets.only(top: 225, left: 10),
                    child: new Text("Spesifikasi",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 250, right: 10, left: 10),
                    child: Container(
                      height: double.infinity,
                      child: Stack(
                        children: <Widget>[
                          _Tabs()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _Logo(){
    return Stack(
      children: <Widget>[
        Container(
          child: Container(
            color: Colors.white70,
          ),
          width: double.infinity,
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background2.png"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Container(
          height: 130.0,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              )
          ),
          child: new Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Logo.png")
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 105, left: 20),
                child: Container(
                  child: Text("Detail Produk",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget _CardMotor({image}){
    return Card(
      elevation: 0,
      child: Container(
        height: 100, width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }
  Widget _PictureDetail(){
    return Stack(
      children: <Widget>[
        Container(
          height: 130, width: double.infinity,
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.curAlbum.image),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 110, left: 17),
          child: Container(
            height: 100,
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      _CardMotor(image: widget.curAlbum.image),
                      _CardMotor(image: widget.curAlbum.image_2),
                      _CardMotor(image: widget.curAlbum.image_3),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget _Tabs(){
    return Container(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: Menu(),
          body: TabBarView(
            children: [
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Mesin()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Rangka()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _DimensiBerat()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Kapasitas()
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    _Kelistrikan()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget Menu(){
    return Container(
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.red,
        indicatorColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: Colors.red,
        ),
        tabs: <Widget>[
          Tab(child: Text("Mesin",style: TextStyle(fontSize: 10))),
          Tab(child: Text("Rangka & Kaki Kaki", style: TextStyle(fontSize: 10))),
          Tab(child: Text("Dimensi & Berat", style: TextStyle(fontSize: 10),),),
          Tab(child: Text("Kapasitas", style: TextStyle(fontSize: 10),),),
          Tab(child: Text("Kelistrikan", style: TextStyle(fontSize: 9.5),),),
        ],
      ),
    );
  }
  Widget _Mesin(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Mesin", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_mesin, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sistem Suplai Bahan Bakar", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.sistem_suplai_bahan_bakar, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Diameter X langkah", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.diameterXlangkah, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Transmisi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_transmisi, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Rasio Kompresi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.rasio_kompresi, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Daya Maksimum", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.daya_maksimum, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Torsi Maksimum", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.torsi_maksimum, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Starter", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_starter, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Kopling", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_kopling, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _Rangka(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sistem Pendingin Mesin", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_pendinginan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Rangka", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_rangka, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Suspensi Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_suspensi_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Suspensi Belakang", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_suspensi_belakang, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Ukuran Ban Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.ukuran_ban_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Ukuran Ban Belakang", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.ukuran_ban_belakang, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Rem Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.rem_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Rem Belakang", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.rem_belakang, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _DimensiBerat(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Panjang X Lebar X Tinggi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.panjangXlebarXtinggi.toString(), style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tinggi Tempat Duduk", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tinggi_tempat_duduk.toString(),  style: TextStyle(color: Colors.white, fontSize: 11),),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Jarak Sumbu Roda", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.jarak_sumbu_roda.toString(), style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Jarak Terendah Ketanah", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.jarak_terendah_ketanah.toString(), style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _Kapasitas(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Curb Weight", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.curb_weight, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Kapasitas Tangki Bahan Bakar", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.kapasitas_tangki_bahan_bakar, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Kapasitas Minyak Pelumas", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.kapasitas_minyak_pelumas, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _Kelistrikan(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Baterai atau Aki", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_baterai_aki, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sistem Pengapian", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.sistem_pengapian, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tipe Busi", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.tipe_busi, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Lampu Depan", style: TextStyle(color: Colors.white, fontSize: 11),),
                  Text(widget.curAlbum.lampu_depan, style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

