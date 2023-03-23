abstract class UserEvent {}

class SignUpEvent extends UserEvent {
  final String email;
  final String userName;
  final String password;

  SignUpEvent({required this.userName, required this.email, required this.password});

}