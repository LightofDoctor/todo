

import 'package:todo/data/repo/auth_repository.dart';

class CreateQuestionUseCase {
   final AuthRepository authRepository;
   CreateQuestionUseCase(this.authRepository);

   Future<bool> checkCreateQuestion(String question,List<String> answers) {
   return authRepository.createQuestions(question,answers);
   }
}