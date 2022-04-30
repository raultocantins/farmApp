import 'package:farm_app/src/features/autentication/domain/repositorys/register_user_repository.dart';

abstract class RegisterUser {
  Future<void> call({required String email, required String password});
}

class RegisterUserImpl implements RegisterUser {
  final RegisterUserRepository registerUserRepository;

  RegisterUserImpl(this.registerUserRepository);
  @override
  Future<void> call({required String email, required String password}) async {
    try {
      await registerUserRepository(email: email, password: password);
    } catch (e) {
      throw Exception(e);
    }
  }
}
