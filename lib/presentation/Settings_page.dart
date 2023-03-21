
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/domain/bloc/navigator_bloc.dart';
import '../domain/bloc/Settings_page/Settings_page_bloc.dart';

import '../domain/bloc/Settings_page/Settings_page_events.dart';
import '../domain/bloc/Settings_page/Settings_page_states.dart';
import '../domain/bloc/sign_in/sign_in_events.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SignInEvent signInEvent;
  late SettingsPageBloc settingsPageBloc;
  late NavigatorBloc _navigatorBloc;

  @override
  void didChangeDependencies() {
    settingsPageBloc = BlocProvider.of<SettingsPageBloc>(context);
    _navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: BlocBuilder(
          bloc: settingsPageBloc,
          builder: (BuildContext context, state) {
            if (state is SettingsPageLoadedState) {
              return Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _logOut();
                          },
                          child: Text('LogOut')),
                      ElevatedButton(
                        onPressed: () {
                          _delAccount();
                        },
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
    settingsPageBloc.add(LogOutEvent());
  }
  _delAccount(){
    settingsPageBloc.add(DeleteAccountEvent());
  }
}
