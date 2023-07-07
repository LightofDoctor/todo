import '../../../data/models/create_question_model.dart';

abstract  class HomePageStates {}


class GoToSettings extends HomePageStates{}

class LoadedHomePageState extends HomePageStates{}
class CreateQuestions extends HomePageStates{}

class ErrorHomePage extends HomePageStates{}

class GoToBackPage extends HomePageStates{}


