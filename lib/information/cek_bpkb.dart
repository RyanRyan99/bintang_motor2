import 'package:flutter/material.dart';


class CheckBpkb extends StatefulWidget {
  @override
  _CheckBpkbState createState() => _CheckBpkbState();
}

class _CheckBpkbState extends State<CheckBpkb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
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
                _Logo()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160, left: 10),
            child: Container(
              child: Text("Masukan No.Polisi:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 97, left: 90),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12,
              ),
              height: 40,
              margin: EdgeInsets.all(50),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 142, left: 310),
            child: Container(
              height: 50,
              child: Card(
                color: Colors.red,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.search, size: 35, color: Colors.white,)
                    ],
                  ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 10, right: 10),
            child: InkWell(
              onTap: (){print("Click");},
              child: Container(
                height: 400.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
                ),
              ),
            ),
          ),
          Container(
            child: InkWell(
              child: Card(
                child: Text("Hubungi Konsumen"),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _Logo(){
    return Stack(
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
            child: Text("Cek BPKB",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
        )
      ],
    );
  }
}
