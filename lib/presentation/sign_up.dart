import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_events.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_states.dart';
import 'package:todo/presentation/home_page.dart';



import '../domain/bloc/navigator_bloc.dart';
import '../domain/bloc/sign_up/sign_up_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SignUpBloc _signUpBloc;
  late final NavigatorBloc _navigatorBloc;
  final _formKey = GlobalKey<FormState>();
  final _nameContorller = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _againpasswordController = TextEditingController();

  @override
  void didChangeDependencies() {
    _signUpBloc = BlocProvider.of<SignUpBloc>(context);
    _navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameContorller.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _againpasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp'),
      ),
      body: BlocBuilder(
          bloc: _signUpBloc,
          builder: (context, state) {
            if (state is UserLoadedState) {
              return Scaffold(
                body: Form(
                  key: _formKey,
                  child: ListView(children: [
                    TextFormField(

                      controller: _nameContorller,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        suffixIcon: Icon(Icons.delete_outline),
                      ),
                      validator: (val) =>
                      val!.isEmpty ? 'Name is required' : null,
                    ),
                    TextFormField(

                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: Icon(Icons.delete_outline)),
                      validator: (val) =>
                      val!.isEmpty ? 'Name is required' : null,
                    ),
                    TextFormField(

                      controller: _passwordController,
                      decoration: InputDecoration(
                          labelText: 'password',
                          suffixIcon: Icon(Icons.delete_outline)),
                      validator: _validatePassword,
                    ),
                    TextFormField(
                      controller: _againpasswordController,
                      decoration: InputDecoration(
                          labelText: 'Repeat password',
                          suffixIcon: Icon(Icons.delete_outline)),
                      validator: _validatePassword,
                    ),
                    ElevatedButton(

                        onPressed: () {
                          _submitFormSignUp();
                        },
                        child: Text('Sign up'))
                  ]),
                ),
              );
            } else if (state is UserLoadingState) {
              return _loadingIndicator();
            } else if (state is UserErrorState) {
              return const Center(
                child: Text('Error'),
              );
            }  else {
              return const Center(
                child: Text('NONE'),
              );
            }
          }
      )
    );
  }

  Widget _loadingIndicator() {
    return Center(child: Text('Loading...'));
  }

  void _submitFormSignUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _signUpBloc.add(SignUpEvent(
        userName: _nameContorller.text,
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ));
    } else
      print('Form is not valid ');
  }

  String? _validatePassword(String? value) {
    if (_passwordController.text != _againpasswordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }
}
