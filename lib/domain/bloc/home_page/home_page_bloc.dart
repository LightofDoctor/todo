
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/models/create_question_model.dart';

import '../../usecase/readUsersUseCase.dart';
import '../navigator_bloc.dart';
import 'home_page_events.dart';
import 'home_page_states.dart';

class HomePageBloc extends Bloc<HomePageEvents,HomePageStates>{
  NavigatorBloc navigatorBloc;
  ReadUsersUseCase readUsersUseCase;
  HomePageBloc({ required this.navigatorBloc, required this.readUsersUseCase}): super (LoadedHomePageState()){
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
    on<ReadQuestionEvent>((event, emit) async{
      emit(LoadedHomePageState());
      try{
        final result = await readUsersUseCase.checkreadUsers();
        if(result == null){
          emit(ErrorHomePage());
        } else{
          emit(DisplayUsersState(users: result as List<Question>));
        }
      }catch(a){
        emit(ErrorHomePage());
        print(a);
      }
    });

  }


}