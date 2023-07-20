import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/models/create_question_model.dart';
import 'package:todo/domain/bloc/read_data_users/read_data_users_events.dart';
import 'package:todo/domain/bloc/read_data_users/read_data_users_states.dart';

import '../../usecase/read_questions_use_case.dart';
import '../home_page/home_page_states.dart';

class QuestionListBloc extends Bloc<QuestionListEvents, QuestionListStates>{
  final ReadQuestionUseCase readQuestionUseCase;
  QuestionListBloc({ required this.readQuestionUseCase}) : super (QuestionsLoadedState()){
    emit(QuestionsLoadedState());
    on<GetQuestionList>((event, emit) async {
      try{
        final userList = await readQuestionUseCase.GetQuestions();
        emit(QuestionListLoaded(userList));
      } catch(a){
        emit(QuestionListError());
        print(a);
  }
});
}


}