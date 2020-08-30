import 'dart:convert';
import 'package:gkjgondokusuman/HomePage.dart';
import 'package:gkjgondokusuman/Setting.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GantiPassword extends StatefulWidget {
  @override
  _GantiPasswordState createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  String cekPassword, passwordBaru;
  final _key = GlobalKey<FormState>();

  Color background = Color(0xffFAFAFA);
  Color icon = Colors.blue;
  Color border_focus = Colors.black;
  jarak() {
    return SizedBox(
      height: 10.0,
    );
  }

  bool _secureText1 = true;

  showHide1() {
    setState(() {
      _secureText1 = !_secureText1;
    });
  }

  bool _secureText2 = true;

  showHide2() {
    setState(() {
      _secureText2 = !_secureText2;
    });
  }

  cek() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      cekSama();
    }
  }

  cekSama() {
    if (passwordBaru != cekPassword) {
      setState(() {
        alertPassword(context);
      });
    } else {
      changePassword();
    }
  }

  changePassword() async {
    http.Response response = await http
        .post("http://10.0.2.2/gondokusuman/api/ubahPassword.php", body: {
      "username": username,
      "password": passwordBaru,
    });
    final data = jsonDecode(response.body);
    print(data);
    int value = data['value'];
    String pesan = data['massage'];
    if (value == 1) {
      setState(() {
        alertYakin(context);
      });
    } else {
      print(pesan);
    }
  }

  void alertPassword(BuildContext context) {
    var alertDialog = AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Password Tidak Sesuai"),
      content: Text("Coba Ulangi lagi"),
      actions: <Widget>[
        FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Ulang")),
      ],
      elevation: 20.0,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
      barrierDismissible: false,
    );
  }

  void alertYakin(BuildContext context) {
    var alertDialog = AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Apakah Anda Yakin Untuk Mengganti Password?"),
      content: Text("Tekan Yes, Jika YAKIN"),
      actions: <Widget>[
        FlatButton(
            color: border_focus,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No")),
        FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  this.context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Setting()));
            },
            child: Text("Yes")),
      ],
      elevation: 20.0,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
      barrierDismissible: false,
    );
  }

  var value;
  var username;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      value = pref.getInt("value");
      username = pref.getString("username");
      // value == 1
      //     ? Navigator.pushReplacement(this.context,
      //         MaterialPageRoute(builder: (BuildContext context) => Home()))
      //     : Navigator.pushReplacement(this.context,
      //         MaterialPageRoute(builder: (BuildContext context) => Login()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  void pop() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Ganti Password",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: background,
          elevation: 0.0,
        ),
        body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                jarak(),
                Text("Masukan Password Baru"),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  obscureText: _secureText1,
                  onSaved: (e) => passwordBaru = e,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      //labelText: 'Password',
                      suffixIcon: IconButton(
                          icon: Icon(_secureText1
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: showHide1),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (val) =>
                      val.isNotEmpty ? null : 'Password tidak boleh kosong',
                ),
                jarak(),
                Text("Masukan Kembali Password Baru"),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  obscureText: _secureText2,
                  onSaved: (e) => cekPassword = e,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      //labelText: 'Password',
                      suffixIcon: IconButton(
                          icon: Icon(_secureText2
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: showHide2),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (val) =>
                      val.isNotEmpty ? null : 'Password tidak boleh kosong',
                ),
                jarak(),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xff0080FF))),
                    onPressed: () {
                      cek();
                    },
                    color: Color(0xff0080FF),
                    textColor: Colors.white,
                    child: Text("Ubah Password".toUpperCase(),
                        style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
