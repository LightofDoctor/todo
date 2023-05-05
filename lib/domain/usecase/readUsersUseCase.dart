import 'package:todo/data/repo/auth_repository.dart';

import '../../data/models/create_question_model.dart';

class ReadUsersUseCase{
  final AuthRepository authRepository;
  ReadUsersUseCase(this.authRepository);


  Future<Users?> checkreadUsers(){
    return authRepository.readUsers();
  }
}