import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:todo/domain/bloc/home_page/home_page_bloc.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/domain/bloc/sign_up/sign_up_bloc.dart';
import 'package:todo/domain/usecase/delete_account_use_case.dart';
import 'package:todo/domain/usecase/log_out_use_case.dart';
import 'package:todo/domain/usecase/sign_up_use_case.dart';

import 'package:todo/presentation/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repo/auth_repository_impl.dart';
import 'domain/bloc/sign_in/sign_in_bloc.dart';
import 'domain/usecase/sign_in_use_case.dart';
import 'package:firebase_core/firebase_core.dart';
Future main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavigatorBloc(_navigatorKey),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SignUpBloc(
                navigatorBloc:  BlocProvider.of<NavigatorBloc>(context),
                signUpUseCase: SignUpUseCase(
                  authRepository: AuthRepositoryImpl(FirebaseAuth.instance), //сюда засунуть FirebaseAuth
                ),
              ), // Репозиторий + usecase
            ),
            BlocProvider(
                create: (context) => SignInBloc(
                      navigatorBloc: BlocProvider.of<NavigatorBloc>(context),
                      signInUseCase: SignInUseCase(AuthRepositoryImpl(FirebaseAuth.instance)),
                    )),
            BlocProvider(
              create: (context) => HomePageBloc(
                    navigatorBloc: BlocProvider.of<NavigatorBloc>(context),
                    logOutUseCase: LogOutUseCase(AuthRepositoryImpl(FirebaseAuth.instance)),
                    deleteAccountUseCase: DeleteAccountUseCase(AuthRepositoryImpl(FirebaseAuth.instance))
              ),
            )
          ],
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            routes: appRouter,
            home: SignIn(),
          ),
        ));
  }
}
