import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/create_questions_bloc/create_qestions_states.dart';
import 'package:todo/domain/bloc/create_questions_bloc/create_questions_bloc.dart';

import '../domain/bloc/create_questions_bloc/create_questions_event.dart';
import '../domain/bloc/navigator_bloc.dart';

import 'package:flutter/material.dart';



class CreateQuestions extends StatefulWidget {
  const CreateQuestions({Key? key}) : super(key: key);

  @override
  State<CreateQuestions> createState() => _CreateQuestionsState();
}

class _CreateQuestionsState extends State<CreateQuestions> {
  final QuestionController = TextEditingController();
  late final NavigatorBloc navigatorBloc;
  late final CreateQuestionsBloc createQuestionBloc;
  @override
  void didChangeDependencies() {
    createQuestionBloc = BlocProvider.of<CreateQuestionsBloc>(context);
    navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    QuestionController.dispose();
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
              return Column(
                children: [
                  TextField(
                      controller: QuestionController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Create question')),
                  ElevatedButton(
                      onPressed: () {

                        createQuestions();
                      },
                      child: Text('Create Question'))
                ],
              );

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
    createQuestionBloc.add(CreateQuestionsEvent(QuestionController.text ));
  }

}

