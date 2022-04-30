abstract class LoginUserWithEmailAndPasswordRepository {
  Future<void> call({required email, required password});
}
