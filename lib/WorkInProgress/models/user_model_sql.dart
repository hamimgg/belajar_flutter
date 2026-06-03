import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModelSql {
  final int? id;
  final String email;
  final String password;
  final String? telepon;
  final String? nama;

  UserModelSql({
    this.id,
    required this.email,
    required this.password,
    this.telepon,
    this.nama,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'nama': nama,
      'telepon': telepon,
    };
  }

  factory UserModelSql.fromMap(Map<String, dynamic> map) {
    return UserModelSql(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      password: map['password'] as String,
      telepon: map['telepon'] != null ? map['telepon'] as String : null,
      nama: map['nama'] != null ? map['nama'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelSql.fromJson(String source) =>
      UserModelSql.fromMap(json.decode(source) as Map<String, dynamic>);
}
