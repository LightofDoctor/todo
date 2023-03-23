import '../domain/bloc/navigator_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/models/create_question_model.dart';

class CreateQuestions extends StatelessWidget {
  final QuestionController = TextEditingController();
  late final NavigatorBloc navigatorBloc;

  CreateQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Create Questions', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
                controller: QuestionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Create question')),
            ElevatedButton(
                onPressed: () {
                  final question = QuestionController.text;
                  createQuestions(question: question);
                },
                child: Text('Create Question'))
          ],
        ),
      ),
    );
  }

  Future createQuestions({required String question}) async {
    final dataQuestion =
        FirebaseFirestore.instance.collection('Questions').doc();

    final userQuestion = CreateQuestion(name: question, id: dataQuestion.id);
    final json = userQuestion.toJson();

    await dataQuestion.set(json);
    navigatorBloc.add(NavigateToHomePage());
  }
}
