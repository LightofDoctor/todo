import 'package:firebase_auth/firebase_auth.dart';

abstract class UserStates {}

class LogOutState extends UserStates {}

class HomePageLoadedState extends UserStates {
  User? user;

  HomePageLoadedState({this.user});
}

class DeleteAccountState extends UserStates {}

class ErrorLogOutState extends UserStates {}

class ErrorDeleteAccountState extends UserStates {}
