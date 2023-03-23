import 'package:todo/data/repo/auth_repository.dart';



class SignInUseCase {
  final AuthRepository authRepository;

 SignInUseCase(this.authRepository);

  Future<bool> execute(String email, String password) =>
   authRepository.signIn(email, password);
  }

