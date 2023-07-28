import '../../../data/models/questions_model.dart';

abstract class QuestionListStates{}




class QuestionListLoading extends QuestionListStates{}
class QuestionsLoadedState extends QuestionListStates{}

class QuestionListLoaded extends QuestionListStates{
  final List<Question> users;
   QuestionListLoaded(this.users);
}
class QuestionListError extends QuestionListStates{

}