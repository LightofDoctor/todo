
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:todo/domain/bloc/home_page/home_page_bloc.dart';



import '../domain/bloc/home_page/home_page_events.dart';
import '../domain/bloc/home_page/home_page_states.dart';
import '../domain/bloc/navigator_bloc.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key, }) : super(key: key);

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
          bloc: homePageBloc,
          builder: (BuildContext, state) {
                 if (state is LoadedHomePageState) {
                   return Center(child: CircularProgressIndicator());
                 }
                   if (state is DisplayUsersState) {
                     final userList = state.users;
                       return ListView.builder(
                         itemCount: userList.length,
                         itemBuilder: (context, index){
                           final user = userList[index];
                           return ListTile(
                             title: Text(user.name),
                           );
                         },


              );
            } else if (state is ErrorHomePage) {
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
