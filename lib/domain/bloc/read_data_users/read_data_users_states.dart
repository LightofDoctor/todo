import '../../../data/models/create_question_model.dart';

abstract class QuestionListStates{}




class QuestionListLoading extends QuestionListStates{}
class QuestionsLoadedState extends QuestionListStates{}

class QuestionListLoaded extends QuestionListStates{
  final List<Question> users;
   QuestionListLoaded({ required this.users});
}
class QuestionListError extends QuestionListStates{

}