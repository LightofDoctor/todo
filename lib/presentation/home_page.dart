import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  late final NavigatorBloc  _navigatorBloc;

  @override
  void didChangeDependencies() {
    _navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Column(children: [
        ElevatedButton(onPressed: (){
          _buttonBackToSignIn();
        }, child: Text('Log out'),
        ),
        ElevatedButton(onPressed: (){
          _buttonBackToSignIn();
        }, child: Text('Delete accaount')),
        Text( user.email!,style: TextStyle(fontSize: 20),)
        
      ],)

    );
  }
  _buttonBackToSignIn(){
    _navigatorBloc.add(NavigateToSignIn());
}
  }

