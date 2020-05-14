import 'dart:convert';

import 'package:bintang_motor/mainpage.dart';
import 'package:bintang_motor/navigator_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum LoginStatus {notSignIn, signIn}
class _LoginScreenState extends State<LoginScreen> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String badgenumber, password;
  final _key = new GlobalKey<FormState>();
  bool _scureText = true;
  check(){
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post("https://bintang-niagajaya.000webhostapp.com/api_login.php",
    body: {"badgenumber": badgenumber});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data["message"];
    String usernameApi = data["badgenumber"];
    String name = data["name"];
    String id = data["id"];
    if(value == 1){
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, usernameApi, name, id);
      });
      print(pesan);
    }
    else{
      showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: Colors.white70,
          title: Text("Invalid", style: TextStyle(color: Colors.red)),
          content: Text("Badgenumber Tidak Ditemukan", style: TextStyle(color: Colors.red)),
        )
      );
    }
  }
  savePref(int value, String usernameApi, String name, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("name", name);
      preferences.setString("badgenumber", usernameApi);
      preferences.setString("id", id);
      preferences.commit();
    });
  }
  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.getInt("value");
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
    signOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus){
      case LoginStatus.notSignIn:
        return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'ID Number :',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Baloo2',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xFFCFD8DC),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 60.0,
                      child: TextFormField(
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.red,
                            fontFamily: 'Baloo2',
                            fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.perm_identity,
                            color: Colors.red,
                            size: 35,
                          ),
                          hintText: 'Masukan ID Anda',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            letterSpacing: 3,
                            color: Colors.red,
                            fontFamily: 'Baloo2',
                          ),
                        ),
                        // ignore: missing_return
                        validator: (e) {
                          if (e.isEmpty) {
                            return "ID Kosong";
                          }
                        },
                        onSaved: (e) => badgenumber = e,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              color: Colors.red,
              splashColor: Colors.white,
              child: Text("Login", style: TextStyle(color: Colors.white)),
              onPressed: (){
                check();
              },
            )
          ],
        ),
      ),
      );
        break;
      case LoginStatus.signIn:
        return NavigatorPage(badgenumber: badgenumber, signOut: signOut,);
        break;
    }
  }
}
