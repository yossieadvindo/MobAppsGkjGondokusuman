import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      //labelText: 'USERNAME, NIP, atau Email',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (val) =>
                      val.isNotEmpty ? null : 'Username/NIP/Email tidak boleh kosong',
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Password'),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      //labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (val) =>
                      val.isNotEmpty ? null : 'Password tidak boleh kosong',
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
                    onPressed: () {},
                    color: Color(0xff0080FF),
                    textColor: Colors.white,
                    child: Text("LOGIN".toUpperCase(),
                        style: TextStyle(fontSize: 18)),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(child: RaisedButton(
                    elevation: 0,
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.black,
                    child: Text("lupa password?".toUpperCase(),
                        style: TextStyle(fontSize: 12)),
                  ),),
                )
                
              ],
            ),
          ),
        )
      ],
    ));
  }
}
