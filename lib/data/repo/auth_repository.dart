import '../models/answer_model.dart';
import '../models/questions_model.dart';

abstract class AuthRepository {
 Future<bool> signIn(String email, String password);

  Future<bool> signUp(String email, String password);

  Future<bool> resetPasswordandEmail(String email);

  Future<bool> deleteAccount();
  Future<bool> logOut ();
  Future<bool> createQuestions(Question question,);
  Future<List<Question>> readQuestions();
}