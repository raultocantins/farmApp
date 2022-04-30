import 'package:farm_app/src/core/user/user_global.dart';
import 'package:farm_app/src/features/autentication/data/repositorys/login_with_emailpassword_repository_impl.dart';
import 'package:farm_app/src/features/autentication/data/repositorys/new_user_repository_impl.dart';
import 'package:farm_app/src/features/autentication/data/repositorys/register_user_repository_impl.dart';
import 'package:farm_app/src/features/autentication/domain/usecases/login_user.dart';
import 'package:farm_app/src/features/autentication/domain/usecases/new_user.dart';
import 'package:farm_app/src/features/autentication/domain/usecases/register_user.dart';
import 'package:farm_app/src/features/autentication/external/login_with_emailpassword_datasource_impl.dart';
import 'package:farm_app/src/features/autentication/external/new_user_datasource_impl.dart';
import 'package:farm_app/src/features/autentication/external/register_user_datasource_impl.dart';
import 'package:farm_app/src/features/autentication/presenter/controllers/auth.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt getIt = GetIt.instance;

//login user
  getIt.registerLazySingleton<LoginUserWithEmailAndPasswordImpl>(() =>
      LoginUserWithEmailAndPasswordImpl(
          LoginUserWithEmailAndPasswordRepositoryImpl(
              LoginUserWithEmailAndPasswordDatasourceImpl())));

  //register user
  getIt.registerLazySingleton<RegisterUserImpl>(() => RegisterUserImpl(
      RegisterUserRepositoryImpl(RegisterUserDatasourceImpl())));

//newuser
  getIt.registerLazySingleton<NewUserImpl>(
      () => NewUserImpl(NewUserRepositoryImpl(NewUserDatasourceImpl())));

  //user controller
  getIt.registerLazySingleton(() => UserGlobal());

//auth controller

  getIt.registerLazySingleton(() => AuthGlobal(getIt(), getIt(), getIt()));
}
