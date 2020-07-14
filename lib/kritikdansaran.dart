import 'package:flutter/material.dart';

class KritikSaran extends StatefulWidget {
  @override
  _KritikSaranState createState() => _KritikSaranState();
}

class _KritikSaranState extends State<KritikSaran> {
      String cekPassword, passwordBaru;
  Color background = Color(0xffFAFAFA);
  Color icon = Colors.blue;
  Color border_focus = Colors.black45;
  jarak() {
    return SizedBox(
      height: 10.0,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kritik Saran",
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            jarak(),
            Text("Tuliskan Kritik dan Saran anda disini"),
            SizedBox(height: 5.0,),
            TextFormField(
                maxLines: 10,
                onSaved: (e) => passwordBaru = e,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    //labelText: 'Tuliskan Kritik dan Saran anda disini',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                validator: (val) =>
                    val.isNotEmpty ? null : 'Silahkan Isi dengan benar',
              ),
              jarak(),
            Container(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0xff0080FF))),
                      onPressed: () {
                        //cek();
                      },
                      color: Color(0xff0080FF),
                      textColor: Colors.white,
                      child: Text("Kirim Kritik dan Saran".toUpperCase(),
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}