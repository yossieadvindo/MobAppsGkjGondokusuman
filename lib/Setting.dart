import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gkjgondokusuman/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Color background = Color(0xffFAFAFA);
  Color icon = Colors.blue;
  Color border_focus = Colors.black45;
  jarak() {
    return SizedBox(
      height: 10.0,
    );
  }

  var value;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      value = pref.getInt("value");
      
    });
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      value = 0;

      Navigator.pushReplacement(this.context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengaturan",
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
      body: ListView(
        padding:
            EdgeInsets.only(top: 10, left: 15.0, right: 15.0, bottom: 10.0),
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.all(0.0),
            color: background,
            elevation: 0.0,
            onPressed: () {
              Navigator.pushNamed(context, "/akun");
            },
            child: Positioned(
              child: Container(
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: new SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                        child: Container(
                      width: 500.0,
                      //height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Yossie Ruben Advindo",
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Wilayah 90",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 0.5,
              width: 130.0,
              color: border_focus,
            ),
          ),
          jarak(),
          RaisedButton(
            elevation: 0.0,
            onPressed: () {
              Navigator.pushNamed(context, '/gantiPassword');
            },
            color: background,
            padding: EdgeInsets.all(0.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.lock_outline,
                    color: icon,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Mengubah Kata Sandi",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      Text(
                        "Digunakan untuk mengubah kata sandi akun",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: border_focus),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          jarak(),
          RaisedButton(
            elevation: 0.0,
            onPressed: () {
              Navigator.pushNamed(context, '/kritikSaran');
            },
            color: background,
            padding: EdgeInsets.all(0.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.paperPlane,
                    color: icon,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Mengirim Kritik dan Saran",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      Text(
                        "Untuk mengirimkan Kritik dan Saran",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: border_focus),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          jarak(),
          RaisedButton(
            elevation: 0.0,
            onPressed: () {},
            color: background,
            padding: EdgeInsets.all(0.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.question,
                    color: icon,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Kebijakan Privasi",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      Text(
                        "Digunakan untuk mengubah kata sandi akun",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: border_focus),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 0.5,
              width: 130.0,
              color: border_focus,
            ),
          ),
          RaisedButton(
            elevation: 0.0,
            onPressed: () {
              logout();
            },
            color: background,
            padding: EdgeInsets.all(0.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.lockOpen,
                    color: icon,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Keluar",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
