import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/create_questions_bloc/create_qestions_states.dart';
import 'package:todo/domain/bloc/create_questions_bloc/create_questions_bloc.dart';
import 'package:todo/domain/bloc/home_page/home_page_bloc.dart';

import '../data/models/answer_model.dart';
import '../data/models/questions_model.dart';
import '../domain/bloc/create_questions_bloc/create_questions_event.dart';
import '../domain/bloc/navigator_bloc.dart';

import 'package:flutter/material.dart';



class CreateQuestionsPage extends StatefulWidget {
  const CreateQuestionsPage({Key? key}) : super(key: key);

  @override
  State<CreateQuestionsPage> createState() => _CreateQuestionsPageState();
}

class _CreateQuestionsPageState extends State<CreateQuestionsPage> {
  List<TextEditingController> item = [];
  final AskQuestion = TextEditingController();
  final AnswerQuestionOne = TextEditingController();
  late final NavigatorBloc navigatorBloc;
  late final CreateQuestionsBloc createQuestionBloc;
  late final HomePageBloc _homePageBloc;



  @override
  void didChangeDependencies() {
    createQuestionBloc = BlocProvider.of<CreateQuestionsBloc>(context);
    navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    AskQuestion.dispose();
    AnswerQuestionOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool? isChekedItem = false;
    bool? isChekedItemTwo = false;
    bool? isChekedItemThree = false;
    return Scaffold(
        appBar: AppBar(
          title:
          Text('Create Questions', style: TextStyle(color: Colors.black87)),
          centerTitle: true,
        ),
        body:BlocBuilder(
          bloc: createQuestionBloc ,
          builder: (context, state){
          if (state is LoadQuestionState){
           return Column(children: [

           ],)
          }
        },)



    );

  }

  void createQuestions() {
    String question = AskQuestion.text;
    item.add(AnswerQuestionOne);

    createQuestionBloc.add(WriteToFirebaseEvent(newQuestions));

  }
  Widget answerItem() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Add answer'),
    );
  }
}

