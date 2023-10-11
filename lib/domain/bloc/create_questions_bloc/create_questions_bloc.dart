





import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/domain/usecase/create_question_use_case.dart';

import '../../../data/models/questions_model.dart';
import '../navigator_bloc.dart';
import 'create_qestions_states.dart';
import 'create_questions_event.dart';

class CreateQuestionsBloc extends Bloc<CreateQuestionEvent,CreateQuestionsState> {
  CreateQuestionUseCase createQuestionUseCase;
  NavigatorBloc navigatorBloc;

  CreateQuestionsBloc(
      { required this.navigatorBloc, required this.createQuestionUseCase})
      : super (LoadedQuestionState()) {
    emit(LoadedQuestionState());
    on<WriteToFirebaseEvent>((event, emit) async {
      try {
        final result = await createQuestionUseCase.checkCreateQuestion(
            event.question);
        result ? navigatorBloc.add(NavigateToSignIn()) : emit(
            ErrorQuestionState());
      } catch (a) {
        emit(ErrorQuestionState());
        print(a);
      }
    }
    );

  }
}