import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:farm_app/src/core/user/data/models/user_model.dart';

import 'package:farm_app/src/features/autentication/data/datasources/new_user_datasource.dart';

class NewUserDatasourceImpl implements NewUserDatasource {
  @override
  Future<void> call(UserModel user) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      await _firestore.collection("users").doc(user.uid).set({
        "name": user.name,
        "email": user.email,
        "uid": user.uid,
        'farmName': user.farmName,
        'plano': user.plano
      });
    } catch (e) {
      throw e as Exception;
    }
  }
}
