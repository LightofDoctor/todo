



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/models/create_question_model.dart';
import 'package:todo/domain/bloc/home_page/home_page_bloc.dart';

import '../domain/bloc/home_page/home_page_events.dart';
import '../domain/bloc/home_page/home_page_states.dart';
import '../domain/bloc/navigator_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 late final NavigatorBloc navigatorBloc;
 late final HomePageBloc homePageBloc;
  @override
  void didChangeDependencies() {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',
        style: TextStyle(color:Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
          homePageBloc.add(GoToBackPageEvent());
          },),
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          IconButton(onPressed: (){
               homePageBloc.add(GoToSettingsEvent());
          }, icon: Icon(Icons.settings))
        ],


      ),
      body: BlocBuilder(
        bloc: homePageBloc,
        builder: (context, state) {
          if( state is ReadUsersState){
            return
            FutureBuilder<Users?>(
                builder: (context, snapshot){
                if(snapshot.hasData){
                  final user = snapshot.data;
                  return user == null? Center(child: Text('No user'),)
                      : buildUser(user);
                }
                else {
                  return Center(child: Text('Error'),);
                }
          },);
          } else{
            return Center(child: Text('ErrorMessage'),);
            }
          },

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
          homePageBloc.add(CreateQuestionsEvent());
      },
      ),
    );
  }
  Widget buildUser(Users user) => ListTile(
    title: Text(user.name),
  );
}
