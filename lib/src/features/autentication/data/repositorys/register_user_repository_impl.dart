import 'package:farm_app/src/features/autentication/data/datasources/register_user_datasource.dart';
import 'package:farm_app/src/features/autentication/domain/repositorys/register_user_repository.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final RegisterUserDatasource registerUserDatasource;

  RegisterUserRepositoryImpl(this.registerUserDatasource);
  @override
  Future<void> call({required String email, required String password}) async {
    try {
      await registerUserDatasource(email: email, password: password);
    } catch (e) {
      throw Exception(e);
    }
  }
}
