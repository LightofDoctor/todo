import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/data/repo/auth_repository.dart';

import '../models/create_question_model.dart';

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

  @override
  Future<bool> createQuestions(String question) async {
    final dataQuestion = FirebaseFirestore.instance.collection('Questions').doc();
    final userQuestion = Users(name: question, id: dataQuestion.id);
    final json = userQuestion.toJson();
    await dataQuestion.set(json);
    return true;
  }

  @override
  Future<Users?> readUsers() async {
         final docUsers = FirebaseFirestore.instance.collection('Questions').doc();
         final snapshot = await docUsers.get();
         if(snapshot.exists){
           return Users.fromJson(snapshot.data()!);
         }

  }




}