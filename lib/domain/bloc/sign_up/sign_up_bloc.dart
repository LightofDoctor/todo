import 'package:bloc/bloc.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_events.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_states.dart';
import 'package:todo/domain/usecase/sign_up_use_case.dart';

import '../navigator_bloc.dart';

class SignUpBloc extends Bloc<UserEvent, UserState> {
  SignUpUseCase signUpUseCase;
  NavigatorBloc navigatorBloc;

  SignUpBloc({ required this.signUpUseCase,  required this.navigatorBloc}) : super(UserLoadedState()) {
    on<SignUpEvent>((event, emit) async {
      try {
        final result  = await signUpUseCase.execute(event.email, event.password);
        result ? navigatorBloc.add(NavigateToSignIn()) : emit(UserErrorState());
      } catch (_) {
        emit(UserErrorState());
      }
    });
  }
}



