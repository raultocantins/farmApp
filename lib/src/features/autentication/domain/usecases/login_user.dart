import 'package:farm_app/src/features/autentication/domain/repositorys/login_user_with_emailpassword.dart';

abstract class LoginUserWithEmailAndPassword {
  Future<void> call({required email, required password});
}

class LoginUserWithEmailAndPasswordImpl
    implements LoginUserWithEmailAndPassword {
  final LoginUserWithEmailAndPasswordRepository
      loginUserWithEmailAndPasswordRepository;

  LoginUserWithEmailAndPasswordImpl(
      this.loginUserWithEmailAndPasswordRepository);

  @override
  Future<void> call({required email, required password}) {
    return loginUserWithEmailAndPasswordRepository(
        email: email, password: password);
  }
}
