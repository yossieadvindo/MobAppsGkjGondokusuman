import 'dart:convert';
import 'dart:io';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class DetailsAkun extends StatefulWidget {
  @override
  _DetailsAkunState createState() => _DetailsAkunState();
}

class _DetailsAkunState extends State<DetailsAkun> {
  TextEditingController _nameLengkap = TextEditingController();
  TextEditingController _nokk = TextEditingController();
  TextEditingController _tmptLahir = TextEditingController();
  TextEditingController _tglLahir = TextEditingController();
  TextEditingController _tglNikah = TextEditingController();
  TextEditingController _noHP = TextEditingController();
  TextEditingController _noTlpn = TextEditingController();
  TextEditingController _namaAyah = TextEditingController();
  TextEditingController _namaIbu = TextEditingController();
  TextEditingController _gerejaNikah = TextEditingController();
  TextEditingController _pendetaNikah = TextEditingController();
  TextEditingController _namaSuamiIstri = TextEditingController();
  TextEditingController _alamatLengkap = TextEditingController();
  Color background = Color(0xffFAFAFA);
  Color icon = Colors.blue;
  Color border_focus = Colors.black45;
  File imgCamera;
  File imgGallery;
  File imageProfile;
  String filename;

  openCamera() async {
    imgCamera = await ImagePicker.pickImage(source: ImageSource.camera);
    if (imgCamera != null) {
      setState(() {
        imageProfile = imgCamera;
        filename = basename(imgCamera.path);
        print(filename);
      });
    }
  }

  openGallery() async {
    imgGallery = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imgGallery != null) {
      setState(() {
        imageProfile = imgGallery;
        filename = basename(imgGallery.path);
        print(filename);
      });
    }
  }

  jarak() {
    return SizedBox(
      height: 10.0,
    );
  }
  

  DateTime selectedTgl = DateTime.now();
  DateTime datePick;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJenkel();
    getGoldar();
    getWilayah();
    getHubkel();
    getPendidikan();
    getPekerjaan();
    getStatNikah();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Future pickDate() async {
      final selectedDate = await _selectDateTime(context);
      if (selectedDate == null) return;

      setState(() {
        this.selectedTgl = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
        );
        _tglLahir.text =
            DateFormat('dd MMMM yyyy').format(selectedTgl).toString();
        print('ini adalah tanggal : ${_tglLahir.text}');
        datePick = selectedTgl;
      });
    }
    Future pickDateMarried() async {
      final selectedDate = await _selectDateTime(context);
      if (selectedDate == null) return;

      setState(() {
        this.selectedTgl = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
        );
        _tglNikah.text =
            DateFormat('dd MMMM yyyy').format(selectedTgl).toString();
        print('ini adalah tanggal : ${_tglLahir.text}');
        datePick = selectedTgl;
      });
    }

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Data Diri",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: background,
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: imageProfile != null
                      ? Image.file(
                          imageProfile,
                          fit: BoxFit.fill,
                        )
                      :
                      // editUser.urlProfile != null
                      // ?
                      // Image.network(
                      //   editUser.urlProfile,
                      //   fit: BoxFit.fill,
                      // )
                      Image.network(
                          "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 18.0,
                      ),
                      onPressed: () {
                        openCamera();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.wallpaper,
                        size: 18.0,
                      ),
                      onPressed: () {
                        openGallery();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          jarak(),
          Container( // nama lengkap
            width: 350,
            child: TextFormField(
              controller: _nameLengkap,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: icon,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nama Lengkap",
              ),
            ),
          ),
          jarak(),
          Container( // no kk 
            width: 350,
            child: TextFormField(
              controller: _nokk,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  Icons.contacts,
                  color: icon,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nomor Kartu Keluarga",
              ),
            ),
          ),
          jarak(),
          Container( //tempat lahir 
            width: 350,
            child: TextFormField(
              controller: _tmptLahir,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  Icons.person_pin_circle,
                  color: icon,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Tempat Lahir",
              ),
            ),
          ),
          jarak(),
          Container( //tgl lahir 
            width: 350.0,
            child: FlatButton(
              focusColor: border_focus,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: border_focus)),
              onPressed: pickDate,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  right: 15.0,
                  bottom: 15.0,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                      color: icon,
                      size: 20,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      _tglLahir.text,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          ),
          jarak(),
          Container(// jen kel 
            decoration: BoxDecoration(
              border: Border.all(
                color: border_focus,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.venusMars,
                    color: icon,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 300.0,
                    child: DropdownButton(
                        hint: Text("Pilih Jenis Kelamin"),
                        isExpanded: true,
                        value: jenkel,
                        items: _jenkel.map((value) {
                          return DropdownMenuItem(
                            child: Text(value['gender']),
                            value: value['id'],
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            jenkel = item;
                            print(jenkel);
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          jarak(),
          Container( // gol dar
            decoration: BoxDecoration(
              border: Border.all(
                color: border_focus,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.tint,
                    color: icon,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 300.0,
                    child: DropdownButton(
                        hint: Text("Pilih Golongan Darah"),
                        isExpanded: true,
                        value: goldar,
                        items: _listGoldar.map((value) {
                          return DropdownMenuItem(
                            child: Text(
                              value['goldar'],
                            ),
                            value: value['id'],
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            goldar = item;
                            print(goldar);
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          jarak(),
          Container( //no hp
            width: 350,
            child: TextFormField(
              controller: _noHP,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: icon,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nomor Handphone",
              ),
            ),
          ),
          jarak(),
          Container( //no tlp
            width: 350,
            child: TextFormField(
              controller: _noTlpn,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  Icons.contact_phone,
                  color: icon,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nomor Telephone",
              ),
            ),
          ),
          jarak(),
          Container( //wil. Greja
            decoration: BoxDecoration(
              border: Border.all(
                color: border_focus,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.globe,
                    color: icon,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 300.0,
                    child: DropdownButton(
                        hint: Text("Pilih Wilayah Gereja"),
                        isExpanded: true,
                        value: wilayah,
                        items: _wilayah.map((value) {
                          return DropdownMenuItem(
                            child: Text(value['wilayah']),
                            value: value['id'],
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            wilayah = item;
                            print(wilayah);
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          jarak(),
          Container( //alamat
            // width: 300,
            // height: 200,
            child: TextFormField(
              controller: _alamatLengkap,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              maxLines: 3,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  FontAwesomeIcons.building,
                  color: icon,
                ),
                contentPadding: EdgeInsets.all(20.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Alamat Rumah",
              ),
            ),
          ),
          jarak(),
          Container( //hubkel
            decoration: BoxDecoration(
              border: Border.all(
                color: border_focus,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.peopleArrows,
                    color: icon,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 300.0,
                    child: DropdownButton(
                        hint: Text("Hubungan Keluarga"),
                        isExpanded: true,
                        value: hubkel,
                        items: _hubkel.map((value) {
                          return DropdownMenuItem(
                            child: Text(
                              value['hubkel'],
                            ),
                            value: value['id'],
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            hubkel = item;
                            print(hubkel);
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          jarak(),
          Container( //pendidikan
            decoration: BoxDecoration(
              border: Border.all(
                color: border_focus,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.graduationCap,
                    color: icon,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 300.0,
                    child: DropdownButton(
                        hint: Text("Pendidikan"),
                        isExpanded: true,
                        value: pendidikan,
                        items: _pendidikan.map((value) {
                          return DropdownMenuItem(
                            child: Text(
                              value['pendidikan'],
                            ),
                            value: value['id'],
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            pendidikan = item;
                            print(pendidikan);
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          jarak(),
          Container( //pekerjaan
            decoration: BoxDecoration(
              border: Border.all(
                color: border_focus,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.graduationCap,
                    color: icon,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 300.0,
                    child: DropdownButton(
                        hint: Text("Pekerjaan"),
                        isExpanded: true,
                        value: pekerjaan,
                        items: _pekeraan.map((value) {
                          return DropdownMenuItem(
                            child: Text(
                              value['pekerjaan'],
                            ),
                            value: value['id'],
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            pekerjaan = item;
                            print(pekerjaan);
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          jarak(),
          Container( //nama ayah
            width: 350,
            child: TextFormField(
              controller: _namaAyah,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  FontAwesomeIcons.male,
                  color: icon,
                  size: 25,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nama Ayah",
              ),
            ),
          ),
          jarak(),
          Container( //nama ibu
            width: 350,
            child: TextFormField(
              controller: _namaIbu,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  FontAwesomeIcons.female,
                  color: icon,
                  size: 25,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nama Ibu",
              ),
            ),
          ),
          jarak(),
          Container( //status nikah
            decoration: BoxDecoration(
              border: Border.all(
                color: border_focus,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.handshake,
                    color: icon,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 300.0,
                    child: DropdownButton(
                        hint: Text("Status Nikah"),
                        isExpanded: true,
                        value: statNikah,
                        items: _statNikah.map((value) {
                          return DropdownMenuItem(
                            child: Text(
                              value['status_nikah'],
                            ),
                            value: value['id'],
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            statNikah = item;
                            print(statNikah);
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          jarak(),
           Container( //tgl nikah 
            width: 350.0,
            child: FlatButton(
              focusColor: border_focus,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: border_focus)),
              onPressed: pickDateMarried,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  right: 15.0,
                  bottom: 15.0,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.marker,
                      color: icon,
                      size: 20,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      _tglNikah.text,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          ),
         jarak(),
          Container( //gereja nikah
            width: 350,
            child: TextFormField(
              controller: _gerejaNikah,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  FontAwesomeIcons.church,
                  color: icon,
                  size: 25,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Gereja Menikah",
              ),
            ),
          ),
         jarak(),
          Container( //pendeta nikah
            width: 350,
            child: TextFormField(
              controller: _pendetaNikah,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  FontAwesomeIcons.cross,
                  color: icon,
                  size: 25,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Pedeta yang Menikahkan",
              ),
            ),
          ),  
         jarak(),
          Container( //gereja nikah
            width: 350,
            child: TextFormField(
              controller: _namaSuamiIstri,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  FontAwesomeIcons.americanSignLanguageInterpreting,
                  color: icon,
                  size: 25,
                ),
                contentPadding: EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: icon,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nama Suami Istri",
              ),
            ),
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
                      child: Text("Selanjutnya".toUpperCase(),
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
        ],
      ),
    );
  }
  String statNikah;
  List<dynamic> _statNikah = List();
  void getStatNikah() async{
    final response = await http.get('http://10.0.2.2/gondokusuman/api/getStatnikah.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _statNikah = listData;
    });
  }
  String jenkel;
  List<dynamic> _jenkel = List();
  void getJenkel() async{
    final response = await http.get('http://10.0.2.2/gondokusuman/api/getGender.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _jenkel = listData;
    });
  }
  String goldar;
  List<dynamic> _listGoldar = List();
  void getGoldar() async{
    final response = await http.get('http://10.0.2.2/gondokusuman/api/getGoldar.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _listGoldar = listData;
    });
  }
  String wilayah;
  List<dynamic> _wilayah = List();
  void getWilayah() async{
    final response = await http.get('http://10.0.2.2/gondokusuman/api/getWilayah.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _wilayah = listData;
    });
  }
  String hubkel;
  List<dynamic> _hubkel = List();
  void getHubkel() async{
    final response = await http.get('http://10.0.2.2/gondokusuman/api/getHubkel.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _hubkel = listData;
    });
  }
  String pendidikan;
  List<dynamic> _pendidikan = List();
  void getPendidikan() async{
    final response = await http.get('http://10.0.2.2/gondokusuman/api/getPendidikan.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _pendidikan = listData;
    });
  }

  String pekerjaan;
  List _pekeraan = List();
  void getPekerjaan() async{
    final response = await http.get('http://10.0.2.2/gondokusuman/api/getPekerjaan.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _pekeraan = listData;
    });
  }

  Future<DateTime> _selectDateTime(BuildContext context) async =>
      showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
}
