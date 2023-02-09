import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/bloc_events.dart';
import 'package:todo/domain/bloc/bloc_logic.dart';
import 'package:todo/domain/bloc/bloc_states.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';





class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final MainBloc _MainBloc;
  late final NavigatorBloc  _navigatorBloc;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    _MainBloc = BlocProvider.of<MainBloc>(context);
    _navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Sign IN',
            style: TextStyle(
                fontSize: 40,
                fontStyle: FontStyle.normal,
                color: Colors.lightBlue.shade900),
          ),
        ),
        body: BlocBuilder(
            bloc:  _MainBloc,
            builder: (context, state) {
              if (state is UserLogOutState) {
                return Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.all(20.0),
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            suffixIcon: Icon(Icons.delete_outline)),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) =>
                            val!.isEmpty ? 'Name is required' : null,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.delete_outline),
                        ),
                        keyboardType: TextInputType.multiline,
                        validator: (val) =>
                            val!.isEmpty ? 'Please check password' : null,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Forgot Password?',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.blue.shade900))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow.shade600),
                        onPressed: () {
                          _submitForm();
                        },
                        child: Text('Sign in',
                            style: TextStyle(
                                fontSize: 18,

                                color: Colors.black,
                                fontStyle: FontStyle.italic)
                        ),
                      ),
                      SizedBox(height: 8,),
                      Row(children: [
                        Text('Do not have an account?'),
                        Container(
                          padding: EdgeInsets.all(15),
                          child:
                          ElevatedButton(onPressed: () {
                            _buttonSignUp();
                          },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white),
                            child:  Text('Sign UP ', style: TextStyle( color: Colors.blue.shade900,)),)
                          ,
                        ),
                      ],)
                    ],
                  ),
                );
              } else if (state is UserLoadedState) {
                _navigatorBloc.add(NavigateToHome());
                return const Center(
                  child: Text('NONE'),
                );
              }
              else {
                return const Center(
                  child: Text("None"),
                );
              }
            }));
  }

  Widget _loadingIndicator() {
    return Center(child: Text('Loading...'));
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _MainBloc
          .add(SignInEvent(email: _emailController.text, password: _passwordController.text));
    } else
      print('Form is not valid ');
  }
 void _buttonSignUp(){
   _navigatorBloc.add(NavigateToSignUp());
 }
}
