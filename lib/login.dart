import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';

import 'navigator_menu.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
enum LoginStatus {notSignIn, signIn}
class _LoginPageState extends State<LoginPage> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String badgenumber, name, points, picture, lokasi;
  final _key = new GlobalKey<FormState>();
  check(){
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      login();
    }
  }
  login() async {
    final response = await http.post("https://bintang-niagajaya.000webhostapp.com/api_login.php",
        body: {"badgenumber": badgenumber, "name": name,});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data["message"];
    String usernameApi = data["badgenumber"];
    String nameAPI = data["name"];
    String point = data['point'];
    String image = data['image'];
    String location = data['lokasi'];
    String id = data["id"];
    if(value == 1){
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, usernameApi, nameAPI, point, image, location, id);
        points = point;
        picture = image;
        lokasi = location;
      });
      print(pesan);
      print(location);
    }
    else{
      showDialog(
          context: context,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            title: Center(child: Text("Invalid", style: TextStyle(color: Colors.red, fontFamily: "Baloo2"))),
            content: Text("Username / Badgenumber Tidak Ditemukan, Coba Lagi !!!", style: TextStyle(color: Colors.red, fontFamily: "Baloo2")),
          )
      );
    }
  }
  savePref(int value, String usernameApi, String point, String name, String image, String lokasi,  String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("name", name);
      preferences.setString("badgenumber", usernameApi);
      preferences.setString("point", point);
      preferences.setString("image", image);
      preferences.setString("id", id);
      preferences.commit();
    });
  }
  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.getInt("value");
      preferences.getString("point");
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;

    });
  }
  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {

    getPref();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          body: Form(
            key: _key,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Colors.red[300],
                        Colors.red[800],
                        Colors.red[400]
                      ]
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AnimationScreen(1, Text(
                          "Sales Point", style: TextStyle(color: Colors
                            .white, fontSize: 35.0, fontFamily: "Baloo2"),)),
                        SizedBox(height: 10.0),
                        AnimationScreen(1.3, Text(
                          "Selamat Datang", style: TextStyle(color: Colors
                            .white, fontSize: 18.0, fontFamily: "Baloo2"),))
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 60.0),
                              AnimationScreen(1.4, Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(
                                            255, 125, 125, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)
                                    )
                                    ]
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Colors.grey[200]))
                                      ),
                                      child: TextFormField(
                                        style: TextStyle(fontFamily: "Baloo2"),
                                        cursorColor: Colors.red,
                                        decoration: InputDecoration(
                                            hintText: "Masukan Nama Anda",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Baloo2"),
                                            border: InputBorder.none
                                        ),
                                        // ignore: missing_return
                                        validator: (e) {
                                          if (e.isEmpty) {
                                            return "Nama Tidak Boleh Kosong";
                                          }
                                        },
                                        onSaved: (e) => name = e,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(
                                              color: Colors.grey[200]))
                                      ),
                                      child: TextFormField(
                                        style: TextStyle(fontFamily: "Baloo2",
                                            letterSpacing: 3),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          WhitelistingTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(4),
                                        ],
                                        cursorColor: Colors.red,
                                        decoration: InputDecoration(
                                          hintText: "Masukan ID Anda",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "Baloo2"),
                                          border: InputBorder.none,
                                        ),
                                        // ignore: missing_return
                                        validator: (e) {
                                          if (e.isEmpty) {
                                            return "ID Tidak Boleh Kosong";
                                          }
                                        },
                                        onSaved: (e) => badgenumber = e,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              SizedBox(height: 40.0),
                              AnimationScreen(1.6, Container(
                                height: 50,
                                width: 200,
                                child: RaisedButton(
                                  child: Text("Login", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Baloo2"),),
                                  color: Colors.red,
                                  splashColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  onPressed: () {
                                    check();
                                  },
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return NavigatorPage(badgenumber: badgenumber, signOut: signOut, name: name, point: points, image: picture, location: lokasi,);
        break;
    }
  }
}

class AnimationScreen extends StatelessWidget {
  final double delay;
  final Widget child;
  AnimationScreen(this.delay, this.child);
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0), curve: Curves.easeOut)
    ]);
    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
          offset: Offset(0, animation["translateY"]),
          child: child,
        ),
      ),
    );
  }
}

