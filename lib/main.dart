
import 'package:flutter/material.dart';
import 'package:gkjgondokusuman/HomePage.dart';
import 'package:gkjgondokusuman/Login.dart';
import 'package:gkjgondokusuman/Setting.dart';
import 'package:gkjgondokusuman/changePassword.dart';
import 'package:gkjgondokusuman/details-akun.dart';
import 'package:gkjgondokusuman/kritikdansaran.dart';
//import 'package:gkjgondokusuman/Login.dart';
import 'package:gkjgondokusuman/splashscreen.dart';
import 'package:gkjgondokusuman/warta.dart';

import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      
      routes: <String, WidgetBuilder>{
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/akun': (context) => DetailsAkun(),
        '/setting': (context) => Setting(),
        '/downloadPage': (context) => Warta(),
        '/gantiPassword': (context) => GantiPassword(),
        '/kritikSaran': (context) => KritikSaran(),
      },
    );
  }
}

