import 'package:farm_app/src/features/autentication/data/datasources/register_user_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUserDatasourceImpl implements RegisterUserDatasource {
  @override
  Future<void> call({required String email, required String password}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      throw e as Exception;
    }
  }
}
