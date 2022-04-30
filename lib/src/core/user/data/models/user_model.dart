import 'dart:convert';

import 'package:farm_app/src/core/user/domain/entities/user_entity.dart';

class UserModel {
  String uid;
  String name;
  String farmName;
  String email;
  String plano;

  UserModel({
    required this.uid,
    required this.name,
    required this.farmName,
    required this.email,
    required this.plano,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'plano': plano,
      'farmName': farmName
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        plano: map['plano'] ?? '',
        farmName: map['farmName'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      email: model.email,
      name: model.name,
      uid: model.uid,
      farmName: model.farmName,
      plano: model.plano,
    );
  }
}
