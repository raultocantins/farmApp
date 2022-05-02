import 'package:farm_app/src/core/shared/error_custom.dart';
import 'package:farm_app/src/core/user/data/models/user_model.dart';

import 'package:farm_app/src/core/user/user_global.dart';
import 'package:farm_app/src/features/autentication/domain/usecases/login_user.dart';
import 'package:farm_app/src/features/autentication/domain/usecases/new_user.dart';
import 'package:farm_app/src/features/autentication/domain/usecases/register_user.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:mobx/mobx.dart';

part 'auth.g.dart';

class AuthGlobal = AuthBase with _$AuthGlobal;

abstract class AuthBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final LoginUserWithEmailAndPasswordImpl? _loginUsecase;
  final RegisterUserImpl? _registerUsecase;
  final NewUserImpl? _newUserImpl;
  final UserGlobal _userGlobal = GetIt.I.get<UserGlobal>();

  AuthBase(this._loginUsecase, this._registerUsecase, this._newUserImpl);

  bool get isActive => _auth.currentUser?.uid != null ? true : false;

  registerUser(BuildContext context,
      {required String email, required String password}) async {
    _userGlobal.changeLoading(true);

    try {
      await _registerUsecase?.call(email: email, password: password);
      _userGlobal.getUser(context);
    } catch (e) {
      _userGlobal.changeLoading(false);

      errorCustom(context, e.toString());
    }
  }

  loginUser(BuildContext context, {required email, required password}) async {
    _userGlobal.changeLoading(true);

    try {
      await _loginUsecase?.call(email: email, password: password);
      _userGlobal.getUser(context);
    } catch (e) {
      _userGlobal.changeLoading(false);

      errorCustom(context, e.toString());
    }
  }

  newUsuario(BuildContext context,
      {required String name,
      required String farmName,
      required String plano}) async {
    _userGlobal.changeLoading(true);
    try {
      await _newUserImpl?.call(UserModel(
          uid: _auth.currentUser!.uid,
          name: name,
          farmName: farmName,
          email: _auth.currentUser!.email!,
          plano: plano));
      _userGlobal.getUser(context);
    } catch (e) {
      _userGlobal.changeLoading(false);
      errorCustom(context, e.toString());
    }
  }

  resetPassword(BuildContext context, {required String userEmail}) async {
    _userGlobal.changeLoading(true);
    try {
      await _auth.sendPasswordResetEmail(email: userEmail);

      Navigator.of(context).pushReplacementNamed('/resetpassconfirm');
      _userGlobal.changeLoading(false);
    } catch (e) {
      _userGlobal.changeLoading(false);
      errorCustom(context, e.toString());
    }
  }

  logout() async {
    await _auth.signOut();
  }
}
