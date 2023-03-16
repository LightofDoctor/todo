import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<bool> signIn(String email, String password);

  Future<bool> signUp(String email, String password);

  Future<bool> resetPasswordandEmail(String email);

  Future<bool> deleteAccount();

  Future<bool> logOut();

  Future<User?> getCurrentUser();
}
