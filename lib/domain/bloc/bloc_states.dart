import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable{
  final bool isLoading;
  final bool successful;
  UserState({ required this.isLoading, required this.successful});
}
class UserLoadedState extends UserState {
  UserLoadedState({required super.isLoading, required super.successful});

  @override
  List<Object?> get props => throw UnimplementedError();
}
class UserLogOutState extends UserState{
  UserLogOutState ({required super.isLoading, required super.successful});
  @override
  List<Object?> get props => throw UnimplementedError();
}