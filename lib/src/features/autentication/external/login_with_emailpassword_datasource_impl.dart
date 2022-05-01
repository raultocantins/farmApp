import 'package:farm_app/src/features/autentication/data/datasources/login_with_emailpassword_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUserWithEmailAndPasswordDatasourceImpl
    implements LoginUserWithEmailAndPasswordDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> call({required email, required password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e as Exception;
    }
  }
}
