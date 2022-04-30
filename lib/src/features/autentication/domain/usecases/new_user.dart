import 'package:farm_app/src/core/user/data/models/user_model.dart';
import 'package:farm_app/src/features/autentication/domain/repositorys/new_user_repository.dart';

abstract class NewUser {
  Future<void> call(UserModel user);
}

class NewUserImpl implements NewUser {
  final NewUserRepository newUserRepository;

  NewUserImpl(this.newUserRepository);

  @override
  Future<void> call(UserModel user) {
    return newUserRepository(user);
  }
}
