

import 'package:todo/data/repo/auth_repository.dart';

class LogOutUseCase{
  final AuthRepository authRepository;

  LogOutUseCase(this.authRepository);

  Future<bool> logOut(){
    return authRepository.deleteAccount();
  }
}