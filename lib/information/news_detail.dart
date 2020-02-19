import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              child: new Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Sample2.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text("Penyebab Ban Motor Tubeless Sering Kempes", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: SizedBox(
                          child: new Center(
                            child: new Container(
                              margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                              height: 2.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 8,),
                              new Icon(Icons.bookmark,color: Colors.red,),
                              SizedBox(
                                width: 80.0,
                                child: Container(
                                  child: Text("Tips & Trik"),
                                ),
                              ),
                              new Icon(Icons.date_range,color: Colors.red,),
                              SizedBox(
                                width: 50.0,
                                child: Container(
                                  child: Text("17 FEB"),
                                ),
                              ),
                              new Icon(Icons.share,color: Colors.red,),
                              SizedBox(
                                width: 80,
                                child: Container(
                                    child: Text("Share")
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                           child: new Stack(
                            children: <Widget>[
                              Container(
                                child: Text("Tekanan angin yang terdapat pada ban tubeless gampang berkurang disebabkan oleh beberapa hal dan tergantung dengan kondisinya.Penyebab yang paling umum atau sering ditemukan karena kondisi ban yang banyak bekas tambalan sehingga tekanan angin rentan bocor.Hal ini pun diperparah jika proses pada saat tambal ban tidak dilakukan dengan benar dan faktor kondisi karet ban yang memang sudah getas.Batas jumlah tambalan di ban yang dianjurkan yaitu maksimal sebanyak 3 lubang dengan syarat jarak yang tidak berdekatan.Selain itu juga, dilihat dari kondisi pelek yang tidak normal juga menjadi penyebab ban tubeless gampang bocor.Contohnya seperti bibir pelek yang tidak rata atau pelek yang retak hak ini tentu akan membuat tekanan angin ban mudah keluar.Meskipun demikian, tekanan angin ban yang cepat habis bisa juga disebabkan oleh hal-hal yang sepele.Seperti pentil ban yang rusak atau dinding ban yang tidak sejajar dengan bibir pelek saat pemasangan.Oleh karena itu, lakukan pengecekan jika angin pada ban mulai cepat berkurang"),
                              )
                            ],
                          ),
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
    );
  }
}
