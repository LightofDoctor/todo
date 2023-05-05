import '../models/create_question_model.dart';

abstract class AuthRepository {
 Future<bool> signIn(String email, String password);

  Future<bool> signUp(String email, String password);

  Future<bool> resetPasswordandEmail(String email);

  Future<bool> deleteAccount();
  Future<bool> logOut ();
  Future<bool> createQuestions(String question);
  Future<Users?> readUsers();
}