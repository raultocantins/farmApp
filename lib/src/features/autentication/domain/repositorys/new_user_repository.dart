import 'package:farm_app/src/core/user/data/models/user_model.dart';

abstract class NewUserRepository {
  Future<void> call(UserModel user);
}
