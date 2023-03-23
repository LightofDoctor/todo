import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/data/repo/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth;
   User? get currentUser => _firebaseAuth.currentUser;
  AuthRepositoryImpl(this._firebaseAuth);
  @override
  Future<bool> signIn(String email, String password) async{
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user?.uid != null;
  }

  @override
  Future<bool> signUp(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password);
      return userCredential.user?.uid != null;
  }

  @override
  Future<bool> resetPasswordandEmail(String email) async {
    final userCredential = await _firebaseAuth.sendPasswordResetEmail(email: email);
    return true;
  }

  @override
  Future<bool> deleteAccount() async {
        final userCredential = await _firebaseAuth.currentUser?.delete();
      return true;
  }

  @override
  Future<bool> logOut() async {
    final userCredential =  await _firebaseAuth.signOut();
    return true;
  }




}