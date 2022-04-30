abstract class RegisterUserRepository {
  Future<void> call({required String email, required String password});
}
