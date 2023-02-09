import 'package:todo/data/repo/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<bool> signIn(String email, String password) async{
    return true;
  }

  @override
  Future<bool> signUp(String email, String password, String name) async {

   return false;
  }



}