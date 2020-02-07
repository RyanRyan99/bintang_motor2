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
                _Logo()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
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
                    padding: const EdgeInsets.only(top: 7 ,left: 90),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12,
                      ),
                      height: 40,
                      margin: EdgeInsets.only(bottom: 50, left: 50, right: 50),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 310),
                    child: Container(
                      height: 50,
                      child: InkWell(
                        onTap: (){print("CL");},
                        child: Card(
                          color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(Icons.search, size: 35, color: Colors.white,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                    child: Container(
                      height: 400.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text("Data Pemilik Kendaraan",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: new SizedBox(
                              child: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          _IsiCard(),
                        ],
                      ),
                    ),
                  ),
                  _TextField(),
                  Padding(
                    padding: const EdgeInsets.only(top: 460, left: 10),
                    child: Container(
                      child: RaisedButton(
                        splashColor: Colors.white,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        onPressed: (){},
                        child: Text("Hubungi Konsumen",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
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
  Widget _IsiCard(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Pemilik Kendaraan",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Type Motor",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Polisi",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Mesin",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("No.Rangka",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Status BPKB",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Tgl Terbit BPKB",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ),
        Divider(),
      ],
    );
  }
  Widget _TextField(){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 118, left: 140),
          child: Container(
            height: 40,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 165, left: 140),
          child: Container(
            height: 40,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 213, left: 140),
          child: Container(
            height: 40,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 261, left: 140),
          child: Container(
            height: 40,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 310, left: 140),
          child: Container(
            height: 40,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 358, left: 140),
          child: Container(
            height: 40,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 405, left: 140),
          child: Container(
            height: 40,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 2.0)]
            ),
          ),
        ),
      ],
    );
  }
}
