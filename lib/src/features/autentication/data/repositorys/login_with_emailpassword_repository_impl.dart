import 'package:farm_app/src/core/exceptions/handle_exceptions.dart';
import 'package:farm_app/src/features/autentication/data/datasources/login_with_emailpassword_datasource.dart';
import 'package:farm_app/src/features/autentication/domain/repositorys/login_user_with_emailpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUserWithEmailAndPasswordRepositoryImpl
    implements LoginUserWithEmailAndPasswordRepository {
  final LoginUserWithEmailAndPasswordDatasource
      loginUserWithEmailAndPasswordDatasource;

  LoginUserWithEmailAndPasswordRepositoryImpl(
      this.loginUserWithEmailAndPasswordDatasource);
  @override
  Future<void> call({required email, required password}) async {
    try {
      await loginUserWithEmailAndPasswordDatasource(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw HandleExceptionsCustom.handleExceptionFirebaseAuth(e);
    } catch (e) {
      throw HandleExceptionsCustom.handleException(e);
    }
  }
}
