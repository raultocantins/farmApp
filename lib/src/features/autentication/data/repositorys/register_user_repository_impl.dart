import 'package:farm_app/src/core/exceptions/handle_exceptions.dart';
import 'package:farm_app/src/features/autentication/data/datasources/register_user_datasource.dart';
import 'package:farm_app/src/features/autentication/domain/repositorys/register_user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final RegisterUserDatasource registerUserDatasource;

  RegisterUserRepositoryImpl(this.registerUserDatasource);
  @override
  Future<void> call({required String email, required String password}) async {
    try {
      await registerUserDatasource(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw HandleExceptionsCustom.handleExceptionFirebaseAuth(e);
    } catch (e) {
      throw HandleExceptionsCustom.handleException(e);
    }
  }
}
