import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gkjgondokusuman/HomePage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username, password;
  final _key = GlobalKey<FormState>();

  void alertLogin(BuildContext context) {
    var alertDialog = AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Username dan Password Tidak Sesuai"),
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

  cek() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      doLogin();
   getDataDua(username);
    }
  }

  Future<List> doLogin() async {  
         getDatadiri(username); 
 
    http.Response response =
        await http.post("http://10.0.2.2/gondokusuman/api/login.php", body: {
      "username": username,
      "password": password,
    });
    final data = jsonDecode(response.body);
    print(data);
    int value = data['value'];
    String uname = data['username'].toString();
    print(uname);
    if (value == 0) {
      setState(() {
        alertLogin(context);
      });
    } else {
      savePref(value, uname);
      Navigator.pushReplacement(this.context,
          MaterialPageRoute(builder: (BuildContext context) => Home()));
    }
  }

  List<dynamic> _dataDua = List();
  Future<List> getDataDua(String kj) async {
    final response = await http.post(
        'http://10.0.2.2/gondokusuman/api/getJemaat2.php',
        body: {"kode_jemaat": "$kj"});
    var listData = jsonDecode(response.body);
    setState(() {
      _dataDua = listData;
      //print(_dataDiri[0]["golongan_darah"]);
    });
  }

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  List<dynamic> _dataDiri = List();
  Future<List> getDatadiri(String kj) async {
    final response = await http.post(
        'http://10.0.2.2/gondokusuman/api/getJemaat.php',
        body: {"kode_jemaat": "$kj"});
    var listData = jsonDecode(response.body);
    setState(() {
      _dataDiri = listData;
      //print(_dataDiri[0]["golongan_darah"]);
    });
  }

  savePref(int value, String username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("golongan_darah", _dataDiri[0]['golangan_darah'].toString());
      pref.setString("nama_lengkap", _dataDiri[0]['nama_lengkap'].toString());
      pref.setString("kode_jemaat", _dataDiri[0]['kode_jemaat'].toString());
      pref.setString("wilayah_gereja", _dataDiri[0]['wilayah_gereja'].toString());
      pref.setInt("value", value);
      pref.setString("username", username);
      pref.setString("no_kk", _dataDiri[0]['no_kk'].toString());
      pref.setString("hub_keluarga", _dataDiri[0]['hub_keluarga'].toString());
      
      
      pref.setString("tempat_lahir", _dataDiri[0]['tempat_lahir'].toString());
      pref.setString("tanggal_lahir", _dataDiri[0]['tanggal_lahir'].toString());
      pref.setString("jenis_kelamin", _dataDiri[0]['jenis_kelamin'].toString());
      
      pref.setString("Alamat", _dataDiri[0]['Alamat'].toString());
      pref.setString("no_hp", _dataDiri[0]['no_hp'].toString());
      pref.setString("no_tlpn", _dataDiri[0]['no_tlpn'].toString());
      pref.setString("pekerjaan", _dataDiri[0]['pekerjaan'].toString());
      
      pref.setString("pendidikan", _dataDiri[0]['pendidikan'].toString());
      pref.setString("nama_ayah", _dataDiri[0]['nama_ayah'].toString());
      pref.setString("nama_ibu", _dataDiri[0]['nama_ibu'].toString());
      pref.setString("status_nikah", _dataDiri[0]['status_nikah'].toString());
      
      pref.setString("tgl_nikah", _dataDiri[0]['tgl_nikah'].toString());
      pref.setString("gereja_nikah", _dataDiri[0]['gereja_nikah'].toString());
      pref.setString("pendeta_nikah", _dataDiri[0]['pendeta_nikah'].toString());
      pref.setString("nama_suamiistri", _dataDiri[0]['nama_suamiistri'].toString());
        pref.setString("pndk", _dataDua[0]['pendidikan'].toString());
      pref.setString("GD", _dataDua[0]['golongan_darah'].toString());
      pref.setString("SN", _dataDua[0]['status_nikah'].toString());
      pref.setString("pkrj", _dataDua[0]['pekerjaan'].toString());
      pref.setString("JK", _dataDua[0]['jenis_kelamin'].toString());
      pref.setString("WG", _dataDua[0]['wilayah_gereja'].toString());
      pref.setString("HK", _dataDua[0]['hub_keluarga'].toString());
      pref.commit();
      print(pref.getString("GD"));
    });
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  scale: 1.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Username/NIP/Email'),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onSaved: (e) => username = e,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            //labelText: 'USERNAME, NIP, atau Email',
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                        validator: (val) => val.isNotEmpty
                            ? null
                            : 'Username/NIP/Email tidak boleh kosong',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Password'),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        obscureText: _secureText,
                        onSaved: (e) => password = e,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            //labelText: 'Password',
                            suffixIcon: IconButton(
                                icon: Icon(_secureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: showHide),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue))),
                        validator: (val) => val.isNotEmpty
                            ? null
                            : 'Password tidak boleh kosong',
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                          child: Text("LOGIN".toUpperCase(),
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Center(
                          child: RaisedButton(
                            elevation: 0,
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.black,
                            child: Text("lupa password?".toUpperCase(),
                                style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
