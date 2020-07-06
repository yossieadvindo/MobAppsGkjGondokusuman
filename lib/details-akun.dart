import 'dart:io';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class DetailsAkun extends StatefulWidget {
  @override
  _DetailsAkunState createState() => _DetailsAkunState();
}

class _DetailsAkunState extends State<DetailsAkun> {
  TextEditingController _nameLengkap = TextEditingController();
  TextEditingController _nokk = TextEditingController();
  TextEditingController _tmptLahir = TextEditingController();
  TextEditingController _tglLahir = TextEditingController();
  TextEditingController _noHP = TextEditingController();
  TextEditingController _noTlpn = TextEditingController();
  TextEditingController _pekerjaan = TextEditingController();
  TextEditingController _alamatLengkap = TextEditingController();
  Color background = Color(0xffFAFAFA);
  Color icon = Color(0xffEAB24C);
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
  Widget build(BuildContext context) {
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
          Container(
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
                focusColor: border_focus,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nama Lengkap",
              ),
            ),
          ),
          jarak(),
          Container(
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
                focusColor: border_focus,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nomor Kartu Keluarga",
              ),
            ),
          ),
          jarak(),
          Container(
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
                focusColor: border_focus,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Tempat Lahir",
              ),
            ),
          ),
          jarak(),
          Container(
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
          Container(
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
                        items: _listGender.map((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
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
          Container(
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
                              value,
                              style: TextStyle(color: border_focus),
                            ),
                            value: value,
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
          Container(
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
                focusColor: border_focus,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nomor Handphone",
              ),
            ),
          ),
          jarak(),
          Container(
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
                focusColor: border_focus,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Nomor Telephone",
              ),
            ),
          ),
          jarak(),
          Container(
            width: 350,
            child: TextFormField(
              controller: _pekerjaan,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  FontAwesomeIcons.building,
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
                focusColor: border_focus,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Pekerjaan",
              ),
            ),
          ),
          jarak(),
          Container(
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
                            child: Text(
                              value,
                              style: TextStyle(color: border_focus),
                            ),
                            value: value,
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
            Container(
            width: 300,
            height: 200,
            child: TextFormField(
              controller: _alamatLengkap,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  FontAwesomeIcons.building,
                  color: icon,
                ),
                contentPadding: EdgeInsets.all(30.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: border_focus,
                )),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: border_focus),
                ),
                focusColor: border_focus,
                labelStyle: TextStyle(color: border_focus),
                hintStyle: TextStyle(color: border_focus),
                hintText: "Alamat Rumah",
              ),
            ),
          ),
        ],
      ),
    );
  }

  String jenkel;
  List _listGender = [
    "Laki-Laki",
    "Perempuan",
  ];
  String goldar;
  List _listGoldar = [
    "A",
    "B",
    "AB",
    "O",
  ];
  String wilayah;
  List _wilayah = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];

  Future<DateTime> _selectDateTime(BuildContext context) async =>
      showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
}
