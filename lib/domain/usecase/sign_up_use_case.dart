


import 'package:todo/data/repo/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<bool> execute(String email, String password,) =>
      authRepository.signUp(email, password);
}