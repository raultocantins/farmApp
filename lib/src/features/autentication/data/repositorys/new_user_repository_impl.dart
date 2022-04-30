import 'package:farm_app/src/core/user/data/models/user_model.dart';
import 'package:farm_app/src/features/autentication/data/datasources/new_user_datasource.dart';
import 'package:farm_app/src/features/autentication/domain/repositorys/new_user_repository.dart';

class NewUserRepositoryImpl implements NewUserRepository {
  final NewUserDatasource newUserDatasource;

  NewUserRepositoryImpl(this.newUserDatasource);
  @override
  Future<void> call(UserModel user) async {
    try {
      await newUserDatasource(user);
    } catch (e) {
      throw Exception(e);
    }
  }
}
