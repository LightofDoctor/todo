import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/presentation/sign_in.dart';

import '../../presentation/Sign_up.dart';
import '../../presentation/home_page.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {

  final GlobalKey<NavigatorState> navigatorkey;

  NavigatorBloc(this.navigatorkey) : super (NavigateToSignIn()) {
    on<NavigatorEvent>((event, emit) {
      if (event is NavigateToSignIn) {
        navigatorkey.currentState?.pushNamed('/sign_in');
      }
      else if (event is NavigateToSignUp) {
        navigatorkey.currentState?.pushNamed('/sign_up');
      }
      else if (event is NavigateToHome) {
        navigatorkey.currentState?.pushNamed('/home');
      }
    }
    );
  }
}



abstract class NavigatorEvent {}

class NavigateToHome extends NavigatorEvent {}

class NavigateToSignUp extends NavigatorEvent {}

class NavigateToSignIn extends NavigatorEvent {}

Map<String, Widget Function(BuildContext)> appRouter = {
  '/sign_in': (context) => SignIn(),
  '/sign_up': (context) => SignUp(),
  '/home': (context) => HomePage(),
};