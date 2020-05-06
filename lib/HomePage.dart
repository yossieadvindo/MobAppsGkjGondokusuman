import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nama = "Yossie Ruben";
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
              onPressed: () async {},
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffFAFAFA),
      body: SingleChildScrollView(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Selamat datang,",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        nama,
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150.0, right: 5.0, left: 5.0),
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
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                        children: mapCarousel<Widget>(visiMisi, (index, url) {
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
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                                borderRadius: BorderRadius.circular(100.0),
                                color: Color(0xffF0F5F7),
                                child: IconButton(
                                  padding: EdgeInsets.all(15.0),
                                  icon: Icon(Icons.person),
                                  color: Color(0xff2BAECB),
                                  iconSize: 30,
                                  onPressed: () async {},
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Akun",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Material(
                                borderRadius: BorderRadius.circular(100.0),
                                color: Color(0xffF0F5F7),
                                child: IconButton(
                                  padding: EdgeInsets.all(15.0),
                                  icon: Icon(Icons.note),
                                  color: Color(0xffEAB24C),
                                  iconSize: 30,
                                  onPressed: () async {},
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
                                borderRadius: BorderRadius.circular(100.0),
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
    );
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
