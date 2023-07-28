import 'package:todo/data/repo/auth_repository.dart';

import '../../data/models/questions_model.dart';

class ReadQuestionUseCase{
  final AuthRepository authRepository;
  ReadQuestionUseCase( this.authRepository);


    Future<List<Question>>  GetQuestions() async {
    return await authRepository.readQuestions();
  }
}