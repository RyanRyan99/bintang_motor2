import 'package:bintang_motor/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  final controller = PageController(
    initialPage: 0,
  );
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
                      height: 280,
                      color: Colors.red,
                        child: PageView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _Mesin(),
                            _Rangka()
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
                      image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/Dominator-Matte-Black-new.png"),
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
                      Card(
                        elevation: 0,
                        child: Container(
                          height: 100, width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/moto-gp-edition_bintangmotor-Jatiasih-1.png"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: Container(
                          height: 100, width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/Dominator-Matte-Black-new.png"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: Container(
                          height: 100, width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/Matte-black-new.png"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
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
  Widget _Mesin(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Tipe Mesin", style: TextStyle(color: Colors.white, fontSize: 11),),
            Divider(),
            Text("Sistem Suplai Bahan Bakar", style: TextStyle(color: Colors.white, fontSize: 11),),
            Divider(),
            Text("Diameter X langkah", style: TextStyle(color: Colors.white, fontSize: 11),),
            Divider(),
            Text("Tipe Transmisi", style: TextStyle(color: Colors.white, fontSize: 11),),
            Divider(),
            Text("Rasio Kompresi", style: TextStyle(color: Colors.white, fontSize: 11),),
            Divider(),
            Text("Daya Maksimum", style: TextStyle(color: Colors.white, fontSize: 11),),
            Divider(),
            Text("Torsi Maksimum", style: TextStyle(color: Colors.white, fontSize: 11),),
            Divider(),
            Text("Tipe Starter", style: TextStyle(color: Colors.white, fontSize: 11),),
            Divider(),
            Text("Tipe Kopling", style: TextStyle(color: Colors.white, fontSize: 11),),
          ],
        ),
      ),
    );
  }
  Widget _Rangka(){
    return Container(
      child: Column(
        children: <Widget>[
          Text("Sistem Pendingin Mesin", style: TextStyle(color: Colors.white, fontSize: 11),),
          Divider(),
          Text("Pola Perpindahan Gigi", style: TextStyle(color: Colors.white, fontSize: 11),),
          Divider(),
          Text("Rangka"),
          Divider(),
          Text("Rangka"),
          Divider(),
        ],
      ),
    );
  }
}
