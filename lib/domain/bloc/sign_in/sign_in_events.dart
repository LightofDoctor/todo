abstract class UserEvent{}


class SignInEvent extends UserEvent{
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}
class SignUpEvent extends UserEvent{}