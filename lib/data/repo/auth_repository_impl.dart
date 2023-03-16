import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/data/repo/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<bool> signIn(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user?.uid != null;
  }

  @override
  Future<bool> signUp(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user?.uid != null;
  }

  @override
  Future<bool> resetPasswordandEmail(String email) async {
    return true;
  }

  @override
  Future<bool> deleteAccount() async {
    final userCredential = await _firebaseAuth.currentUser?.delete();
    return true;
  }

  @override
  Future<bool> logOut() async {
    final userCredential = await _firebaseAuth.signOut();
    return true;
  }

  @override
  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }
}
