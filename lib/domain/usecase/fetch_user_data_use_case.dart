import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/data/repo/auth_repository.dart';

class FetchUserDataUseCase {
  final AuthRepository authRepository;

  FetchUserDataUseCase(this.authRepository);

  Future<User?> execute() {
    return authRepository.getCurrentUser();
  }
}
