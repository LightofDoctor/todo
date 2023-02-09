
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/domain/bloc/bloc_logic.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/presentation/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repo/auth_repository_impl.dart';


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
        child: BlocProvider(
              create: (context) => MainBloc(
               )
          ,
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            routes: appRouter,
            home: SignIn(),
          ),
        )
    );
  }
}


