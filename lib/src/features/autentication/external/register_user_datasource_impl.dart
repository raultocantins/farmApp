import 'package:farm_app/src/core/user/utils/auth_exception.dart';
import 'package:farm_app/src/features/autentication/data/datasources/register_user_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUserDatasourceImpl implements RegisterUserDatasource {
  @override
  Future<void> call({required String email, required String password}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw AuthException("A senha é muito fraca");
      } else if (e.code == "email-already-in-use") {
        throw AuthException("Este email já está cadastrado");
      } else {
        throw Exception(e);
      }
    }
  }
}
