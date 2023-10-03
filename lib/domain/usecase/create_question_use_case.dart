

import 'package:todo/data/repo/auth_repository.dart';

import '../../data/models/answer_model.dart';
import '../../data/models/questions_model.dart';

class CreateQuestionUseCase {
   final AuthRepository authRepository;
   CreateQuestionUseCase(this.authRepository);

   Future<bool> checkCreateQuestion(Question question) {
   return authRepository.createQuestions(question);
   }
}