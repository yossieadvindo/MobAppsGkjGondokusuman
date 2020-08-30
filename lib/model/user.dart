//import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String kodeJemaat;
  String nameLengkap;
  String nokk;
  String tmptLahir;
  String tglLahir;
  String tglNikah;
  String noHP;
  String noTlpn;
  String namaAyah;
  String namaIbu;
  String gerejaNikah;
  String pendetaNikah;
  String namaSuamiIstri;
  String alamatLengkap;
  String jenisKelamin;
  String golonganDarah;
  String idPekerjaan;
  String idPendidikan;
  String idstatusNikah;
  String hubunganKeluarga;
  String idWilayah;

  User({
    this.kodeJemaat,
    this.nameLengkap,
    this.nokk,
    this.tmptLahir,
    this.tglLahir,
    this.noHP,
    this.noTlpn,
    this.namaAyah,
    this.namaIbu,
    this.alamatLengkap,
    this.jenisKelamin,
    this.golonganDarah,
    this.idPekerjaan,
    this.idPendidikan,
    this.hubunganKeluarga,
    this.idWilayah,
    this.idstatusNikah,
    this.gerejaNikah,
    this.pendetaNikah,
    this.tglNikah,
    this.namaSuamiIstri,
  });

  // User.fromMap(Map<String, dynamic> userMaps) {
  //   this.uid = userMaps['id'];
  //   this.namaLengkap = userMaps['namaLengkap'];
  //   this.username = userMaps['username'];
  //   this.email = userMaps['email'];
  //   this.urlProfile = userMaps['urlProfile'];
  // }

  // factory User.fromDocument(DocumentSnapshot document) {
  //   return User(
  //     uid: document['id'],
  //     namaLengkap: document['namaLengkap'],
  //     username: document['username'],
  //     email: document['email'],
  //     urlProfile: document['urlProfile'],
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': uid,
  //     'namaLengkap': namaLengkap,
  //     'username': username,
  //     'email': email,
  //     'urlProfile': urlProfile,
  //   };
  // }
}
