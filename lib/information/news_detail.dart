import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  String berita = "Bintangmotor.com – Musim penghujan yang masih terus berlangsung hingga saat ini menyebabkan beberapa jalanan terendam genangan air.Anda harus berhati-hati jika melintasi jalanan yang terendam air. Sebab bisa menyebabkan air masuk ke dalam ruang mesin dan bercampur dengan oli.Genangan air tersebut bisa menyebabkan kerusakan pada mesin motor, karena air yang masuk dan tercampur dengan oli.Cara mengetahui oli tercampur dengan air adalah dengan melihat warna oli. Jika oli berwarna putih maka dipastikan oli sudah tercampur dengan air.Lalu, seperti apa efek buruk yang terjadi pada mesin motor?Pertama-tama yang perlu diketahui bahwa oli punya sifat demulsifier, yang mempunyai makna bahwa oli bisa memisahkan diri dengan air, tetapi dalam kasus ini oli dan air bersatu di dalam satu tempat yang sama meskipun tetap terpisah.Lalu yang kedua pelumasan pada mesin menjadi tidak optimal karena adanya air yang bercampur oli. Efeknya mesin akan menjadi berat dan membuat suhu mesin akan menjadi lebih panas.Akibat buruk lainnyasifat asam air yang tercampur oli akan mengakibatkan karat dan membuat mesin menjadi keropos.Bila hal ini terus dipaksakan untuk tetap digunakan, akan mengakibatkan kerusakan mesin motor, kandungan air yang tercampur dengan oli bisa membuat korosi pada komponen yang ada di dalam mesin, sehingga mesin motor akan cepat rusak.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/berita.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black54.withOpacity(.8),
                    Colors.black12.withOpacity(.1),
                  ]
                )
              ),
              child: Container(
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 80),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Motor Bebek Irit Honda",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 280),
            child: Container(
              margin: EdgeInsets.all(10),
              height: 600,
              width: double.infinity,
              child: new Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    right: 25,
                    top: 10,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.bookmark, color: Colors.black54,),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text("Tips & Trick"),
                          ),
                          Container(
                            child: Icon(Icons.date_range, color: Colors.black54,),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text("Feb 19"),
                          ),
                          InkWell(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Icon(Icons.share, color: Colors.black54,),
                                ),
                                SizedBox(
                                  width: 70,
                                  child: Text("Share Post"),
                                )
                              ],
                            ),
                            onTap: (){print("C");},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 55, left: 8, right: 8),
                    child: Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SingleChildScrollView(
                          child: Container(
                            child: Text(berita,textAlign: TextAlign.justify),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  new BoxShadow(blurRadius: 8.0)
                ]
              ),
            ),
          ),
          SizedBox(
            child: Center(
              child: Container(
                height: 1,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
