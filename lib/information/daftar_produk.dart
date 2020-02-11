import 'package:bintang_motor/information/detail_produk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
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
                    child: Text("Daftar Produk",
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
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 140,
                      color: Colors.white70,
                      child: new Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, right: 8.0, left: 8.0, bottom: 10.0),
                            child: new Text("Premium",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    _PremiumCard()
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Container(
                      height: 140,
                      color: Colors.white70,
                      child: new Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, right: 8.0, left: 8.0, bottom: 10.0),
                            child: new Text("Sport",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    _SportCard()
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 295),
                    child: Container(
                      height: 140,
                      color: Colors.white70,
                      child: new Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, right: 8.0, left: 8.0, bottom: 10.0),
                            child: new Text("Matic",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    _MaticCard()
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 440),
                    child: Container(
                      height: 140,
                      color: Colors.white70,
                      child: new Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, right: 8.0, left: 8.0, bottom: 10.0),
                            child: new Text("Cub",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    _CubCard()
                                  ],
                                ),
                              )
                            ],
                          )
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
  Widget _PremiumCard(){
    return Container(
      child: Row(
        children: <Widget>[
           Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.red,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => new DetailProduk()
                  ));
                },
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                height: 100, width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/advance-black-metallic-bintangmotor-1.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
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
          ),
        ],
      ),
    );
  }
  Widget _SportCard(){
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                height: 100, width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/advance-black-metallic-bintangmotor-1.png"),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _MaticCard(){
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                height: 100, width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://bintangmotor.com/wp-content/uploads/2019/08/advance-black-metallic-bintangmotor-1.png"),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _CubCard(){
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                height: 100, width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://bintangmotor.com/wp-content/uploads/listing-uploads/gallery/2019/12/pearl-shining-black-1024x343.png"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}













