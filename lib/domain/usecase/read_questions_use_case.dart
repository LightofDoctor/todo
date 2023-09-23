import 'package:todo/data/repo/auth_repository.dart';

import '../../data/models/question_model.dart';

class ReadQuestionUseCase{
  final AuthRepository authRepository;
  ReadQuestionUseCase( this.authRepository);


    Future<List<QuestionModel>>  getQuestions() async {
    return await authRepository.readQuestions();
  }
}