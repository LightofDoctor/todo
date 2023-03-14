import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_events.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_state.dart';


import 'package:bloc/bloc.dart';

import '../../usecase/sign_in_use_case.dart';

class SignInBloc extends Bloc<UserEvent,UserState> {
  SignInUseCase signInUseCase;
  NavigatorBloc navigatorBloc;

  SignInBloc({required this.navigatorBloc, required this.signInUseCase}) : super (UserLoadedState()) {
    emit(UserLoadedState());
    on<SignInEvent>((event, emit) async {
      try {
        final result = await signInUseCase.execute(event.email, event.password);
          result ? navigatorBloc.add(NavigateToHome()) : emit(UserErrorState());
      } catch (_) {
        emit(UserErrorState());
      }
    },
    );
    on<SignUpEvent>((event, emit) {
      navigatorBloc.add(NavigateToSignUp());
      emit(UserGoToSignUpState());
    });
  }


}
