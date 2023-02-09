import 'package:equatable/equatable.dart';
abstract class UserEvent extends Equatable {}


class SignInEvent extends UserEvent{
  final String email;
  final String password;

  SignInEvent({required this.email,required this.password});
  @override
  List<Object?> get props => throw UnimplementedError();
}
class resetPasswordAndEmailEvent extends UserEvent{
  final  String email;
  resetPasswordAndEmailEvent({ required this.email});

  @override
  List<Object?> get props => throw UnimplementedError();


}
class SignUpEvent extends UserEvent {
  final String email;
  final String password;
  SignUpEvent({required this.email, required this.password});

  @override
  List<Object?> get props => throw UnimplementedError();

}
class LogOutEvent extends UserEvent {
  LogOutEvent();

  @override
  List<Object?> get props => throw UnimplementedError();

}