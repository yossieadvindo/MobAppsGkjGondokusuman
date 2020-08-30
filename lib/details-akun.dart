import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DetailsAkun extends StatefulWidget {
  @override
  _DetailsAkunState createState() => _DetailsAkunState();
}

class _DetailsAkunState extends State<DetailsAkun> {
  TextEditingController namePanjang,
      kk,
      t4Lahir,
      tglahir,
      hp,
      tlpn,
      ayah,
      ibu,
      greja,
      pendeta,
      suamiIstri,
      alamat,
      tglnkh;

  String _nameLengkap,
      _nokk,
      _tmptLahir,
      _tglLahir,
      _tglNikah,
      _noHP,
      _noTlpn,
      _namaAyah,
      _namaIbu,
      _gerejaNikah,
      _pendetaNikah,
      _namaSuamiIstri,
      _alamatLengkap;
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
  String jenisKelamin;
  String golonganDarah;
  String idPekerjaan;
  String idPendidikan;
  String idstatusNikah;
  String hubunganKeluarga;
  String idWilayah;
  String jk, gd, pkrj, pndk, hk, wg, sn;
  var kode_jemaat;
    String statNikah;
  List<dynamic> _statNikah = List();
  void getStatNikah() async {
    final response =
        await http.get('http://10.0.2.2/gondokusuman/api/getStatnikah.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _statNikah = listData;
    });
  }

  String jenkel;
  List<dynamic> _jenkel = List();
  void getJenkel() async {
    final response =
        await http.get('http://10.0.2.2/gondokusuman/api/getGender.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _jenkel = listData;
    });
  }

  String goldar;
  List<dynamic> _listGoldar = List();
  void getGoldar() async {
    final response =
        await http.get('http://10.0.2.2/gondokusuman/api/getGoldar.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _listGoldar = jsonDecode(response.body);
    });
  }

  String wilayah;
  List<dynamic> _wilayah = List();
  void getWilayah() async {
    final response =
        await http.get('http://10.0.2.2/gondokusuman/api/getWilayah.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _wilayah = listData;
    });
  }

  String hubkel;
  List<dynamic> _hubkel = List();
  void getHubkel() async {
    final response =
        await http.get('http://10.0.2.2/gondokusuman/api/getHubkel.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _hubkel = listData;
    });
  }

  String pendidikan;
  List<dynamic> _pendidikan = List();
  void getPendidikan() async {
    final response =
        await http.get('http://10.0.2.2/gondokusuman/api/getPendidikan.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _pendidikan = listData;
    });
  }

  String pekerjaan;
  List _pekeraan = List();
  void getPekerjaan() async {
    final response =
        await http.get('http://10.0.2.2/gondokusuman/api/getPekerjaan.php');
    var listData = jsonDecode(response.body);
    setState(() {
      _pekeraan = listData;
    });
  }

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      getGoldar();
      jk = pref.getString("JK").toString();
      gd = pref.getString("GD").toString();
      pkrj = pref.getString("pkrj").toString();
      pndk = pref.getString('pndk').toString();
      hk = pref.getString("HK").toString();
      wg = pref.getString("WG").toString();
      sn = pref.getString("SN").toString();
      kode_jemaat = pref.getString("username").toString();
      _nameLengkap = pref.getString('nama_lengkap');
      _nokk = pref.getString('no_kk').toString();
      hubkel = pref.getString('hub_keluarga').toString();
      wilayah = pref.getString('wilayah_gereja').toString();
      _tmptLahir = pref.getString('tempat_lahir').toString();
      _tglLahir = pref.getString('tanggal_lahir').toString();
      jenkel = pref.getString('jenis_kelamin').toString();
      goldar = pref.getString("golongan_darah").toString();
      _alamatLengkap = pref.getString('Alamat').toString();
      _noHP = pref.getString('no_hp').toString();
      _noTlpn = pref.getString('no_tlpn').toString();
      pekerjaan = pref.getString('pekerjaan').toString();
      pendidikan = pref.getString('pendidikan').toString();
      _namaAyah = pref.getString('nama_ayah').toString();
      _namaIbu = pref.getString('nama_ibu').toString();
      statNikah = pref.getString('status_nikah').toString();
      _tglNikah = pref.getString('tgl_nikah').toString();
      _gerejaNikah = pref.getString('gereja_nikah').toString();
      _pendetaNikah = pref.getString('pendeta_nikah').toString();
      _namaSuamiIstri = pref.getString('nama_suamiistri').toString();
      print(idWilayah);
      setup();
      getJenkel();
      getWilayah();
      getHubkel();
      getPendidikan();
      getPekerjaan();
      getStatNikah();
      print("ini goldar2: $gd");
    print("ini jk: $jk");
    print("ini pkr: $pkrj");
    print("ini pdd: $pndk");
    print("ini sn: $sn");
    print("ini hk: $hk");
    print("ini wg: $wg");
      // value == 1
      //     ? Navigator.pushReplacement(this.context,
      //         MaterialPageRoute(builder: (BuildContext context) => Home()))
      //     : Navigator.pushReplacement(this.context,
      //         MaterialPageRoute(builder: (BuildContext context) => Login()));
    });
  }

  setup() {
    namePanjang = TextEditingController(text: _nameLengkap);
    kk = TextEditingController(text: _nokk);
    t4Lahir = TextEditingController(text: _tmptLahir);
    tglahir = TextEditingController(text: _tglLahir);
    hp = TextEditingController(text: _noHP);
    tlpn = TextEditingController(text: _noTlpn);
    ayah = TextEditingController(text: _namaAyah);
    ibu = TextEditingController(text: _namaIbu);
    greja = TextEditingController(text: _gerejaNikah);
    pendeta = TextEditingController(text: _pendetaNikah);
    suamiIstri = TextEditingController(text: _namaSuamiIstri);
    alamat = TextEditingController(text: _alamatLengkap);
    tglnkh = TextEditingController(text: _tglNikah);
  }

  void changeData(String kode_jemaat, 
      String _nameLengkap,
      String _nokk,
      String _tmptLahir,
      String _tglLahir,
      String _alamatLengkap,
      String _noHP,
      String _noTlpn,
      String _namaAyah,
      String _namaIbu,
      String _tglNikah,
      String _gerejaNikah,
      String _pendetaNikah,
      String _namaSuamiIstri,
      String golDar,
      String jenKel,
      String hubKel,
      String wil,
      String pekerjaan,
      String pendidikan,
      String status,
      
      ) async {
    // if (golonganDarah == goldar &&
    //     hubunganKeluarga == hubkel &&
    //     jenisKelamin == jenkel &&
    //     idWilayah == wilayah &&
    //     idPekerjaan == pekerjaan &&
    //     idPendidikan == pendidikan &&
    //     idstatusNikah == statNikah) {
    print(_nameLengkap);
    print(_nokk);
    print(_tmptLahir);
    print(_alamatLengkap);
    print(_noHP);
    print(_noTlpn);
    print(_namaAyah);
    print(_namaIbu);
    print(_tglLahir);
    print(_tglNikah);
    print(_gerejaNikah);
    print(_pendetaNikah);
    print(_namaSuamiIstri);
    print(golDar);
    print(jenKel);
    print(hubKel);
    print(wil);
    print(pekerjaan);
    print(pendidikan);
    print(status);
    final response = await http
        .post("http://10.0.2.2/gondokusuman/api/updateDataDiri.php", body: {
      "kode_jemaat": kode_jemaat.toString(),
      "nama_lengkap": _nameLengkap.toString(),
      "no_kk": _nokk.toString(),
      "tempat_lahir": _tmptLahir.toString(),
      "tanggal_lahir": _tglLahir.toString(),
      "Alamat": _alamatLengkap.toString(),
      "no_hp": _noHP.toString(),
      "no_tlpn": _noTlpn.toString(),
      "nama_ayah": _namaAyah.toString(),
      "nama_ibu": _namaIbu.toString(),
      "tgl_nikah": _tglNikah.toString(),
      "gereja_nikah": _gerejaNikah.toString(),
      "pendeta_nikah": _pendetaNikah.toString(),
      "nama_suamiistri": _namaSuamiIstri.toString(),
      "golongan_darah": golDar,
      "jenis_kelamin": jenKel,
      "hub_keluarga": hubKel,
      "wilayah_gereja": wil,
      "pekerjaan": pekerjaan,
      "pendidikan": pendidikan,
      "status_nikah": status,
    });
    final data = jsonDecode(response.body);
    print(data);
    // int value = data['value'];
    // String pesan = data['massage'];
    // if (value == 1) {
    //   // setState(() {
    //   //   alertYakin(context);
    //   // });
    // } else {
    //   print(pesan);
    // }
    // }
  }

  List<dynamic> _dataDiri = List();
  Future<List> getDatadiri(String kj) async {
    final response = await http.post(
        'http://10.0.2.2/gondokusuman/api/getJemaat.php',
        body: {"kode_jemaat": "$kj"});
    var listData = jsonDecode(response.body);
    setState(() {
      _dataDiri = listData;
      //savePref();
      //print(_dataDiri[0]["golongan_darah"]);
    });
  }

  savePref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("golongan_darah", gd);
      pref.setString("nama_lengkap", namePanjang.text);
      pref.setString("kode_jemaat", kode_jemaat);
      pref.setString("wilayah_gereja", wg);
     
      pref.setString("no_kk", kk.text);
      pref.setString("hub_keluarga", hk);
      
      
      pref.setString("tempat_lahir", t4Lahir.text,);
      pref.setString("tanggal_lahir", tglahir.text,);
      pref.setString("jenis_kelamin", jk);
      
      pref.setString("Alamat", alamat.text);
      pref.setString("no_hp", hp.text,);
      pref.setString("no_tlpn",  tlpn.text,);
      pref.setString("pekerjaan", pkrj);
      
      pref.setString("pendidikan", pndk);
      pref.setString("nama_ayah", ayah.text);
      pref.setString("nama_ibu", ibu.text);
      pref.setString("status_nikah", sn);
      
      pref.setString("tgl_nikah",  tglnkh.text);
      pref.setString("gereja_nikah", greja.text);
      pref.setString("pendeta_nikah",  pendeta.text);
      pref.setString("nama_suamiistri", suamiIstri.text);
      //   pref.setString("pndk", _dataDua[0]['pendidikan'].toString());
      // pref.setString("GD", _dataDua[0]['golongan_darah'].toString());
      // pref.setString("SN", _dataDua[0]['status_nikah'].toString());
      // pref.setString("pkrj", _dataDua[0]['pekerjaan'].toString());
      // pref.setString("JK", _dataDua[0]['jenis_kelamin'].toString());
      // pref.setString("WG", _dataDua[0]['wilayah_gereja'].toString());
      // pref.setString("HK", _dataDua[0]['hub_keluarga'].toString());
      pref.commit();
      print(pref.getString("GD"));
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    getPref();
    //setup();
    ///namePanjang.text = _nameLengkap;
    print(_nameLengkap);
    

    super.initState();
  }

  final _key = GlobalKey<FormState>();
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
        _tglLahir = DateFormat('yyyy-mm-dd').format(selectedTgl).toString();
        print('ini adalah tanggal : ${_tglLahir.toString()}');
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
        _tglNikah = DateFormat('yyyy-mm-dd').format(selectedTgl).toString();
        print('ini adalah tanggal : ${_tglLahir.toString()}');
        datePick = selectedTgl;
      });
    }

    return Form(
      key: _key,
      child: Scaffold(
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
            Container(// nama lengkap
              width: 350,
              child: TextFormField(
                controller: namePanjang,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
            Container(// no kk
              width: 350,
              child: TextFormField(
                controller: kk,
                // onSaved: (e) => _nokk = e,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
            Container(//tempat lahir
              width: 350,
              child: TextFormField(
                controller: t4Lahir,
                //onSaved: (e) => _tmptLahir = e,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
            Container(//tgl lahir
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
                        _tglLahir.toString(),
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
                      child: DropdownButtonFormField(
                          hint: Text(
                            jenkel,
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          value: jenisKelamin,
                          items: _jenkel.map((value) {
                            return DropdownMenuItem(
                              child: Text(value['jenis_kelamin']),
                              value: value['id'],
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              if(newValue != null){
                                jk = newValue;
                              }else{
                                jenisKelamin = newValue;
                              }
                                print(jk);
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            jarak(),
            Container(// gol dar
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
                          hint: Text(
                            goldar,
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          value: golonganDarah,
                          items: _listGoldar.map((value) {
                            return DropdownMenuItem(
                              child: Text(
                                value['golangan_darah'],
                              ),
                              value: value['id'],
                            );
                          }).toList(),
                          onChanged: (item) {
                            setState(() {
                              print("tem $item");
                              if(item != null){
                                gd = item;
                              }else{
                                golonganDarah = item;
                                
                              }
                              print(gd);
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            jarak(),
            Container(  //no hp
              width: 350,
              child: TextFormField(
                controller: hp,
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
            Container(//no tlp
              width: 350,
              child: TextFormField(
                controller: tlpn,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
                          hint: Text(
                            wilayah,
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          value: idWilayah,
                          items: _wilayah.map((value) {
                            return DropdownMenuItem(
                              child: Text(
                                value['wilayah_gereja'],
                              ),
                              value: value['id'],
                            );
                          }).toList(),
                          onChanged: (item) {
                            setState(() {
                              if (item != null) {
                                wg = item;
                              }else{
                              idWilayah = item;
                              }
                              print(wg);
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
                controller: alamat,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
                          hint: Text(
                            hubkel,
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          value: hubunganKeluarga,
                          items: _hubkel.map((value) {
                            return DropdownMenuItem(
                              child: Text(
                                value['hub_keluarga'],
                              ),
                              value: value['id'],
                            );
                          }).toList(),
                          onChanged: (item) {
                            setState(() {
                              if (item != null) {
                                hk = item;
                              }else{
                              hubunganKeluarga = item;
                              }
                              print(hk);
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            jarak(),
            Container(//pendidikan
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
                          hint: Text(
                            pendidikan,
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          value: idPendidikan,
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
                              if (item != null) {
                                pndk = item;
                              }else{
                                
                              idPendidikan = item;
                              }
                              print(pndk);
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            jarak(),
            Container(//pekerjaan
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
                          hint: Text(
                            pekerjaan,
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          value: idPekerjaan,
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
                              if (item != null) {
                                pkrj = item;
                              }else{
                                
                              idPekerjaan = item;
                              }
                              print(pkrj);
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            jarak(),
            Container(//nama ayah
              width: 350,
              child: TextFormField(
                controller: ayah,
                //onSaved: (e) => _namaAyah = e,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
            Container(//nama ibu
              width: 350,
              child: TextFormField(
                controller: ibu,
                //onSaved: (e) => _namaIbu = e,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
            Container(//status nikah
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
                          hint: Text(
                            statNikah,
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          value: idstatusNikah,
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
                              if (item != null) {
                                sn = item;
                              }else{
                                
                              idstatusNikah = item;
                              }
                              print(sn);
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            jarak(),
            Container(//tgl nikah
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
                        _tglNikah,
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
            jarak(),
            Container(//gereja nikah
              width: 350,
              child: TextFormField(
                controller: greja,
                //onSaved: (e) => _gerejaNikah = e,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
                controller: pendeta,
                //onSaved: (e) => _pendetaNikah = e,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
            Container( //suami istri
              width: 350,
              child: TextFormField(
                controller: suamiIstri,
                //onSaved: (e) => _namaSuamiIstri = e,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
                  changeData(
                    kode_jemaat,
                    namePanjang.text,
                    kk.text,
                    t4Lahir.text,
                    tglahir.text,
                    alamat.text,
                    hp.text,
                    tlpn.text,
                    ayah.text,
                    ibu.text,
                    tglnkh.text,
                    greja.text,
                    pendeta.text,
                    suamiIstri.text,
                    gd,
                    jk,
                    hk,
                    wg,
                    pkrj,
                    pndk,
                    sn  
                  );
                  print("ini $golonganDarah");
                  savePref();
                  Navigator.pop(context);
                },
                color: Color(0xff0080FF),
                textColor: Colors.white,
                child: Text("Selanjutnya".toUpperCase(),
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List<dynamic> _dataDiri = List();
  // Future<List> getDatadiri(String kj) async {
  //   final response = await http.post(
  //       'http://10.0.2.2/gondokusuman/api/getJemaat.php',
  //       body: {"kode_jemaat": "$kj"});
  //   var listData = jsonDecode(response.body);
  //   setState(() {
  //     _dataDiri = listData;
  //   });
  // }

  



  Future<DateTime> _selectDateTime(BuildContext context) async =>
      showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
}
