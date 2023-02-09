abstract class AuthRepository {
 Future<void> signInWithEmailAndPassword(String email, String password);

  Future<void> createUserWithPasswordAndEmail(String email, String password);

 Future<void> sendResetPasswordAndEmail(String email);

}