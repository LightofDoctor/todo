import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/presentation/sign_in.dart';

import '../../presentation/Settings_page.dart';
import '../../presentation/Sign_up.dart';
import '../../presentation/create_questions.dart';
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
      else if (event is NavigateToSettings) {
        navigatorkey.currentState?.pushNamed('/settings');
      }
      else if (event is NavigateToHomePage){
        navigatorkey.currentState?.pushNamed('/homePage');
      }
      else if (event is NavigateToCreateQuestions){
        navigatorkey.currentState?.pushNamed('/createQuestions');
      }
    }
    );
  }
}



abstract class NavigatorEvent {}
class NavigateToCreateQuestions extends NavigatorEvent{}

class NavigateToSettings extends NavigatorEvent {}

class NavigateToSignUp extends NavigatorEvent {}

class NavigateToSignIn extends NavigatorEvent {}

class NavigateToHomePage extends NavigatorEvent{}

Map<String, Widget Function(BuildContext)> appRouter = {
  '/sign_in': (context) => SignIn(),
  '/sign_up': (context) => SignUp(),
  '/settings': (context) => SettingsPage(),
  '/homePage': (context) => HomePage(),
  '/createQuestions' : (context) => CreateQuestionsPage(),

};