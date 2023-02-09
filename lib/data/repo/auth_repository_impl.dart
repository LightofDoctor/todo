import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/data/repo/auth_repository.dart';


class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> signInWithEmailAndPassword( String email, String password) async{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void>createUserWithPasswordAndEmail( String email, String password ) async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void>sendResetPasswordAndEmail( String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<String?> signOut() async{
    await _firebaseAuth.signOut();
  }

}