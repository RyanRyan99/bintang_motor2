import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
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
                      height: 230,
                      color: Colors.red,
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
}
