import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/create_questions_bloc/create_qestions_states.dart';
import 'package:todo/domain/bloc/create_questions_bloc/create_questions_bloc.dart';
import 'package:todo/domain/bloc/home_page/home_page_bloc.dart';

import '../domain/bloc/create_questions_bloc/create_questions_event.dart';
import '../domain/bloc/navigator_bloc.dart';

import 'package:flutter/material.dart';



class CreateQuestionsPage extends StatefulWidget {
  const CreateQuestionsPage({Key? key}) : super(key: key);

  @override
  State<CreateQuestionsPage> createState() => _CreateQuestionsPageState();
}

class _CreateQuestionsPageState extends State<CreateQuestionsPage> {
  List<String> items = [];
  final AskQuestion = TextEditingController();
  final AnswerQuestionOne = TextEditingController();
  final AnswerQuestionTwo = TextEditingController();
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
    AnswerQuestionTwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
          Text('Create Questions', style: TextStyle(color: Colors.black87)),
          centerTitle: true,
        ),
        body: BlocBuilder(

          bloc:  createQuestionBloc,
          builder: (context, state){
            if(state is LoadedQuestionState){
              return Form(
                child: ListView(children: [
                  const Text('Question'),
                  const SizedBox(height: 16,),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Ask questions'),
                    controller: AskQuestion,

                  ),
                  const SizedBox(height: 16,),
                  const Text('Answers'),
                  const SizedBox(height: 16,),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Add answer'),
                    controller:  AnswerQuestionOne,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Add answer'),
                    controller: AnswerQuestionTwo,
                  ),
                  ElevatedButton(onPressed: (){
                    readAnswers();
                    print(items);
                  }, child: Text('GO!')),
                  ElevatedButton(onPressed: (){
                    createQuestions();
                  }, child: Text('Write in dataBase'))

                ],

                )



                ,);


            } else{
              return const Center(
                child: Text("None"),
              );
            }
          },
        )
    );

  }

  void createQuestions() {
    createQuestionBloc.add(CreateQuestionsEvent(AskQuestion.text,items));

  }
    readAnswers(){
    items.clear();
    items.add(AnswerQuestionOne.text);
    items.add(AnswerQuestionTwo.text);

    }
}

