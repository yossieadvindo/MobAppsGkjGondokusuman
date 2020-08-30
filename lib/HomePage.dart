import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gkjgondokusuman/Login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  // String nama = "";
  // String id = "";
  // Home({this.id,this.nama});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nama = "";
  String id = "";
  int _current = 0;
  List visiMisi = [
    'assets/visi.png',
    'assets/misi.png',
  ];
  List<T> mapCarousel<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  // List<dynamic> _dataDiri = List();
  // dataDiri(){
  //   getDatadiri(id_jemaat);
  //   getDataDua(id_jemaat);
  //   savePref();
  // }
  // Future<List> getDatadiri(String kj) async {
  //   print(kj);
  //   final response = await http.post(
  //       'http://10.0.2.2/gondokusuman/api/getJemaat.php',
  //       body: {"kode_jemaat": "$kj"});
  //   var listData = jsonDecode(response.body);
  //   setState(() {
  //     _dataDiri = listData;
    
  //     //print(_dataDiri[0]["golongan_darah"]);
  //   });
  // }
  // List<dynamic> _dataDua = List();
  // Future<List> getDataDua(String kj) async {
  //   final response = await http.post(
  //       'http://10.0.2.2/gondokusuman/api/getJemaat2.php',
  //       body: {"kode_jemaat": "$kj"});
  //   var listData = jsonDecode(response.body);
  //   setState(() {
  //     _dataDua = listData;
  //     //print(_dataDiri[0]["golongan_darah"]);
  //   });
  // }
  // savePref() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     pref.setInt("key", value);
  //     pref.setString("golongan_darah", _dataDiri[0]['golangan_darah'].toString());
  //     pref.setString("kode_jemaat", _dataDiri[0]['kode_jemaat'].toString());
  //     pref.setString("no_kk", _dataDiri[0]['no_kk'].toString());
  //     pref.setString("nama_lengkap", _dataDiri[0]['nama_lengkap'].toString());
  //     pref.setString("hub_keluarga", _dataDiri[0]['hub_keluarga'].toString());
      
  //     pref.setString("wilayah_gereja", _dataDiri[0]['wilayah_gereja'].toString());
      
  //     pref.setString("tempat_lahir", _dataDiri[0]['tempat_lahir'].toString());
  //     pref.setString("tanggal_lahir", _dataDiri[0]['tanggal_lahir'].toString());
  //     pref.setString("jenis_kelamin", _dataDiri[0]['jenis_kelamin'].toString());
      
  //     pref.setString("Alamat", _dataDiri[0]['Alamat'].toString());
  //     pref.setString("no_hp", _dataDiri[0]['no_hp'].toString());
  //     pref.setString("no_tlpn", _dataDiri[0]['no_tlpn'].toString());
  //     pref.setString("pekerjaan", _dataDiri[0]['pekerjaan'].toString());
      
  //     pref.setString("pendidikan", _dataDiri[0]['pendidikan'].toString());
  //     pref.setString("nama_ayah", _dataDiri[0]['nama_ayah'].toString());
  //     pref.setString("nama_ibu", _dataDiri[0]['nama_ibu'].toString());
  //     pref.setString("status_nikah", _dataDiri[0]['status_nikah'].toString());
      
  //     pref.setString("tgl_nikah", _dataDiri[0]['tgl_nikah'].toString());
  //     pref.setString("gereja_nikah", _dataDiri[0]['gereja_nikah'].toString());
  //     pref.setString("pendeta_nikah", _dataDiri[0]['pendeta_nikah'].toString());
  //     pref.setString("nama_suamiistri", _dataDiri[0]['nama_suamiistri'].toString());
  //       pref.setString("pndk", _dataDua[0]['pendidikan'].toString());
  //     pref.setString("GD", _dataDua[0]['golangan_darah'].toString());
  //     pref.setString("SN", _dataDua[0]['status_nikah'].toString());
  //     pref.setString("pkrj", _dataDua[0]['pekerjaan'].toString());
  //     pref.setString("JK", _dataDua[0]['jenis_kelamin'].toString());
  //     pref.setString("WG", _dataDua[0]['wilayah_gereja'].toString());
  //     pref.setString("HK", _dataDua[0]['hub_keluarga'].toString());
  //     pref.commit();
  //     print(pref.getString("golongan_darah"));
  //   });
  // }
  var value;
  String wilayah;
  var id_jemaat;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      value = pref.getInt("value");
      nama = pref.getString('nama_lengkap');
      wilayah = pref.getString("wilayah_gereja");
      //id_jemaat = pref.getString("kode_jemaat");
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
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffDDE8EC),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image(
                image: AssetImage('assets/logo_black.png'),
                width: 200.0,
              ),
              IconButton(
                padding: EdgeInsets.all(15.0),
                icon: Icon(Icons.settings),
                color: Color(0xffEAB24C),
                iconSize: 30,
                onPressed: () async {
                  Navigator.pushNamed(context, '/setting');
                },
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xffFAFAFA),
        body: ListView(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: CustomShapeClipper(),
                        child: Container(
                          height: 240.0,
                          decoration: BoxDecoration(color: Color(0xffDDE8EC)),
                          child: Image.asset(
                            'assets/bg_appbar.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 15.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "$nama",
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Wilayah $wilayah",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 150.0, right: 5.0, left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CarouselSlider(
                              height: 125,
                              initialPage: 0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              reverse: false,
                              enableInfiniteScroll: false,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 10000),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              pauseAutoPlayOnTouch: Duration(seconds: 10),
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index) {
                                setState(() {
                                  _current = index;
                                });
                              },
                              items: visiMisi.map((imgUrl) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                offset: Offset(0.0, 3.0),
                                                blurRadius: 15.0)
                                          ]),
                                      child: Image.asset(
                                        imgUrl,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  mapCarousel<Widget>(visiMisi, (index, url) {
                                return Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? Color(0xffB5574F)
                                        : Color(0xffEAB24C),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 325.0, right: 25.0, left: 25.0, bottom: 10.0),
                        child: Container(
                          width: double.infinity,
                          height: 150.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0.0, 3.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Color(0xffF0F5F7),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.person),
                                        color: Color(0xff2BAECB),
                                        iconSize: 30,
                                        onPressed: () async {
                                          //dataDiri();
                                          Navigator.pushNamed(context, '/akun');
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Data Diri",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Color(0xffF0F5F7),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.note),
                                        color: Color(0xffEAB24C),
                                        iconSize: 30,
                                        onPressed: () async {
                                          Navigator.pushNamed(
                                              context, '/downloadPage');
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Warta Jemaat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Color(0xffF0F5F7),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.list),
                                        color: Color(0xffB5574F),
                                        iconSize: 30,
                                        onPressed: () async {},
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Daftar Majelis",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
