import 'package:flutter/material.dart';
import 'package:gkjgondokusuman/HomePage.dart';
//import 'package:gkjgondokusuman/Login.dart';
import 'package:gkjgondokusuman/splashscreen.dart';

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
        '/home': (context) => Home(),
      },
    );
  }
}

