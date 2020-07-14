import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Warta extends StatefulWidget {
  @override
  _WartaState createState() => _WartaState();
}

class _WartaState extends State<Warta> {
  Color background = Color(0xffFAFAFA);
  Color icon = Color(0xffEAB24C);
  Color border_focus = Colors.black45;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Warta Jemaat",
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
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/download.jpg"),
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Color(0xff2BAECB),
            child: Container(
                width: 150.0,
                
                decoration: new BoxDecoration(
                  
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Download',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )),
            onPressed: () async => {
              Navigator.pop(context),
            },
          )
        ],
      ),
    );
  }
}
