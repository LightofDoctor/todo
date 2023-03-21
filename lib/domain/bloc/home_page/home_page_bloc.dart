
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigator_bloc.dart';
import 'home_page_events.dart';
import 'home_page_states.dart';

class HomePageBloc extends Bloc<HomePageEvents,HomePageStates>{
  NavigatorBloc navigatorBloc;
  HomePageBloc({ required this.navigatorBloc}): super (LoadedHomePageState()){
    emit(LoadedHomePageState());

    on<GoToSettingsEvent>((event, emit) {
      navigatorBloc.add(NavigateToSettings());
    });

    on<CreateQuestionsEvent>((event, emit) {
      navigatorBloc.add(NavigateToCreateQuestions());
    });

    on<GoToBackPageEvent>((event, emit) {
      navigatorBloc.add(NavigateToSignIn());
    });
  }


}