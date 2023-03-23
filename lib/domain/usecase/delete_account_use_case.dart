import '../../data/repo/auth_repository.dart';

class DeleteAccountUseCase {
  final AuthRepository authRepository;

  DeleteAccountUseCase(this.authRepository);

  Future<bool> delAccount(){
    return authRepository.deleteAccount();
  }
}