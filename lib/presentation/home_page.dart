
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:todo/domain/bloc/home_page/home_page_bloc.dart';



import '../domain/bloc/home_page/home_page_events.dart';
import '../domain/bloc/home_page/home_page_states.dart';
import '../domain/bloc/navigator_bloc.dart';
import '../domain/bloc/read_data_users/read_data_users_bloc.dart';
import '../domain/bloc/read_data_users/read_data_users_states.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key, }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NavigatorBloc navigatorBloc;
  late final HomePageBloc homePageBloc;
  late final QuestionListBloc questionListBloc;


  @override
  void didChangeDependencies() {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    questionListBloc = BlocProvider.of<QuestionListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            homePageBloc.add(GoToBackPageEvent());
          },
        ),
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          IconButton(
              onPressed: () {
                homePageBloc.add(GoToSettingsEvent());
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: BlocBuilder(
          bloc: questionListBloc,
          builder: (BuildContext, state) {
                 if (state is QuestionListLoading) {
                   return Center(child: CircularProgressIndicator());
                 }
                   if (state is QuestionListLoaded) {
                     final questionList = state.users;
                       return ListView.builder(
                         itemCount: questionList.length,
                         itemBuilder: (context, index){
                           final user = questionList[index];
                           return ListTile(
                             title: Text(user.name),
                           );
                         },


              );
            } else if (state is QuestionListError) {
              return Text("Error: Unable to load users");
            } else {
              return CircularProgressIndicator();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homePageBloc.add(CreateQuestionsEvent());
        },
      ),
    );
  }
}
