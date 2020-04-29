import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                backBgCover(),
              ],
            )
          ],
        ),
      ),
    );
  }

  backBgCover() {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFDDE8EC), Color(0xff7CB1C1)])),
      child: Image(image: AssetImage('assets/gkjgondokusuman.png')),
      );
  }
}
