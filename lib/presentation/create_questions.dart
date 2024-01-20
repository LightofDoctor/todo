import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/create_questions_bloc/create_questions_bloc.dart';
import '../data/models/questions_model.dart';
import '../domain/bloc/create_questions_bloc/create_questions_event.dart';
import 'package:todo/data/models/answer_model.dart';
import 'package:flutter/material.dart';



class CreateQuestionsPage extends StatefulWidget {
  const CreateQuestionsPage({Key? key}) : super(key: key);

  @override
  State<CreateQuestionsPage> createState() => _CreateQuestionsPageState();
}

class _CreateQuestionsPageState extends State<CreateQuestionsPage> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  List<Answers> answers = [];
  late final CreateQuestionsBloc createQuestionBloc;

  @override
  void didChangeDependencies() {
    createQuestionBloc = BlocProvider.of<CreateQuestionsBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Questions', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: questionController,
            decoration: InputDecoration(labelText: 'Question'),
          ),
          ...answers
              .asMap()
              .entries
              .map(
                (entry) => TextField(
              controller: TextEditingController(text: entry.value as String),
              decoration: InputDecoration(labelText: 'Answer ${entry.key + 1}'),
              onChanged: (text) {
                answers[entry.key] = text as Answers;
              },
            ),
          )
              .toList(),
          ElevatedButton(
            onPressed: () {
              if (answers.length < 10) {
                answers.add('' as Answers);
                setState(() {});
              }
            },
            child: Text('Add Answer'),
          ),
          ElevatedButton(
            onPressed: () {
              createQuestionBloc.add(
                WriteToFirebaseEvent(
                  Question(
                    name: questionController.text,
                    answers: answers, id: '',
                  ),
                ),
              );
            },
            child: Text('Add Question'),
          ),
        ],
      ),
    );
  }
}

