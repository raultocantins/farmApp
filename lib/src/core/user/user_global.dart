import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_app/src/core/exceptions/handle_exceptions.dart';
import 'package:farm_app/src/core/shared/error_custom.dart';

import 'package:farm_app/src/core/user/domain/entities/user_entity.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

part 'user_global.g.dart';

class UserGlobal = UserGlobalBase with _$UserGlobal;

abstract class UserGlobalBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserGlobalBase();
  UserEntity? usuario;

  @observable
  bool isLoading = false;

  @action
  changeLoading(bool isloading) => isLoading = isloading;

  bool get isActive => _auth.currentUser?.uid != null ? true : false;

  getUser(BuildContext context) async {
    var uid = _auth.currentUser?.uid;
    if (uid != null && _auth.currentUser!.emailVerified) {
      try {
        var userInf =
            await _firestore.collection("users").doc(uid).get().then((value) {
          return value.data();
        });

        if (userInf != null) {
          usuario = UserEntity(
              uid: userInf["uid"],
              name: userInf["name"],
              email: userInf["email"],
              farmName: userInf["farmName"],
              plano: userInf["plano"]);

          Navigator.of(context).pushReplacementNamed("/home");
          changeLoading(false);
        } else {
//primeiro acesso, registrar informações
          Navigator.of(context).pushReplacementNamed("/registerfarm");
          changeLoading(false);
        }
      } catch (e) {
        changeLoading(false);
        errorCustom(context, HandleExceptionsCustom.handleException(e));
      }
    } else if (uid != null && !_auth.currentUser!.emailVerified) {
      changeLoading(false);
      Navigator.of(context).pushReplacementNamed("/verifyemail");
    } else {
      changeLoading(false);
      Navigator.of(context).pushReplacementNamed("/authentication");
    }
  }
}
