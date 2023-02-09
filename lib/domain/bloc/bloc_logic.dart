import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:todo/data/repo/auth_error.dart';
import 'package:todo/data/repo/auth_repository_impl.dart';
import 'package:todo/domain/bloc/bloc_events.dart';
import 'package:todo/domain/bloc/bloc_states.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';


class MainBloc extends Bloc<UserEvent,UserState>{
 late final NavigatorBloc  _navigatorBloc;
  final MainError _mainError = MainError();
  MainBloc() : super(UserLogOutState(isLoading: true, successful: false)){
    on<SignInEvent>((event, emit) async {
      try{
        await AuthRepositoryImpl().signInWithEmailAndPassword(event.email, event.password);
        _navigatorBloc.add(NavigateToHome());
      }
       on FirebaseAuthException catch (e){
          emit(UserLogOutState(isLoading: false, successful: true));
      }
    });

    on<LogOutEvent>((event, emit) async {

      try{ emit(UserLogOutState(isLoading: true, successful: false));
        await AuthRepositoryImpl().signOut();
      emit(UserLogOutState(isLoading: false, successful: true));
      }
      on FirebaseAuthException catch (e){
      }
    });
    on<SignUpEvent>((event, emit) async {

      try{ emit(UserLogOutState(isLoading: true, successful: false));
        await AuthRepositoryImpl().createUserWithPasswordAndEmail( event.email, event.password);
      emit(UserLogOutState(isLoading: false, successful: true));
      }
      on FirebaseAuthException catch (e){
        print(e);
        _mainError.authErrorLogin =e.toString();
        emit(UserLogOutState(isLoading: false, successful: true));
      }
    });

    on<resetPasswordAndEmailEvent>((event, emit) async {
      emit(UserLogOutState(isLoading: true, successful: false));
      try{await AuthRepositoryImpl().sendResetPasswordAndEmail(event.email);
      emit(UserLogOutState(isLoading: false, successful: true));
      }
      on FirebaseAuthException catch (e){
        print(e);
        _mainError.authErrorLogin =e.toString();
        emit(UserLogOutState(isLoading: false, successful: true));
      }
    });
  }

}