
abstract class UserError{

}


class MainError extends UserError{
  String authErrorRegistr = '';
  String authErrorLogin = '';
  MainError([this.authErrorLogin = '', this.authErrorRegistr = '']);
}
