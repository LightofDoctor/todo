import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/create_questions_bloc/create_qestions_states.dart';
import 'package:todo/domain/bloc/create_questions_bloc/create_questions_bloc.dart';
import 'package:todo/domain/bloc/home_page/home_page_bloc.dart';

import '../domain/bloc/create_questions_bloc/create_questions_event.dart';
import '../domain/bloc/navigator_bloc.dart';

import 'package:flutter/material.dart';

class CreateQuestions2Page extends StatefulWidget {
  const CreateQuestions2Page({Key? key}) : super(key: key);

  @override
  State<CreateQuestions2Page> createState() => _CreateQuestions2PageState();
}

class _CreateQuestions2PageState extends State<CreateQuestions2Page> {
  List<TextEditingController> items = [];
  late final NavigatorBloc navigatorBloc;
  late final CreateQuestionsBloc createQuestionBloc;

  @override
  void didChangeDependencies() {
    createQuestionBloc = BlocProvider.of<CreateQuestionsBloc>(context);
    navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    addAnswerItem();
    super.didChangeDependencies();
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
          bloc: createQuestionBloc,
          builder: (context, state) {
            if (state is LoadedQuestionState) {
              return Form(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return answerItem(index);
                },
                itemCount: items.length,
              ));
            } else {
              return const Center(
                child: Text("None"),
              );
            }
          },
        ));
  }

  Widget answerItem(int index) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Add answer'),
      controller: items[index],
    );
  }

  void addAnswerItem() {
    if (items.length >= 10) {
      return;
    }

    final textEditingController = TextEditingController();
    items.add(textEditingController);
    subscribeToAnswerChanges(textEditingController);
    setState(() {});
  }

  void removeAnswerItem(TextEditingController textEditingController) {
    int index = items.indexOf(textEditingController);
    subscribeToAnswerChanges(items[index-1]);
    items.removeAt(index);
    setState(() {});
  }

  void subscribeToAnswerChanges(TextEditingController textEditingController) {
    textEditingController.addListener(() {
      if (textEditingController.text.length > 1) {
        unsubscribeLastTextEditingController(textEditingController);
        addAnswerItem();
      } else if (textEditingController.text.isEmpty){
        unsubscribeLastTextEditingController(textEditingController);
        removeAnswerItem(textEditingController);
      }
    });
  }

  void unsubscribeLastTextEditingController(
      TextEditingController textEditingController) {
    textEditingController.dispose();
  }

  void createQuestions() {
    createQuestionBloc.add(CreateQuestionsEvent("title", items.map((element) => element.text).toList()));
  }

  readAnswers() {
    items.clear();
  }
}
