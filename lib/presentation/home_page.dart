import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/home_page/home_page_events.dart';
import 'package:todo/domain/bloc/home_page/home_page_states.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';

import '../domain/bloc/home_page/home_page_bloc.dart';
import '../domain/bloc/sign_in/sign_in_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SignInEvent signInEvent;
  late HomePageBloc homePageBloc;
  late NavigatorBloc _navigatorBloc;

  @override
  void didChangeDependencies() {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    _navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: BlocBuilder(
          bloc: homePageBloc,
          builder: (BuildContext context, state) {
            if (state is HomePageLoadedState) {
              return Container(
                  child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _logOut();
                      },
                      child: Text('LogOut')),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('DeleteAccount'),
                  ),
                  Text('Hello')
                ],
              ));
            } else if (state is ErrorLogOutState) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Center(
                child: Text("None"),
              );
            }
          }),
    );
  }
  _logOut(){
    homePageBloc.add(LogOutEvent());
  }
}
