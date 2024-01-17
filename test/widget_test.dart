
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/domain/bloc/read_data_users/read_data_users_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_bloc.dart';
import 'package:todo/domain/usecase/read_questions_use_case.dart';


import 'package:todo/domain/usecase/sign_in_use_case.dart';
import 'package:todo/presentation/sign_in.dart';

import 'widget_test.mocks.dart';





@GenerateNiceMocks([MockSpec<SignInUseCase>(), MockSpec<NavigatorBloc>(),MockSpec<ReadQuestionUseCase>()])

void main(){
  late MockNavigatorBloc navigatorBloc;
  late MockSignInUseCase signInUseCase;
  late QuestionListBloc questionListBloc;
  late SignInBloc signInBloc;
   setUp(() {
     navigatorBloc = MockNavigatorBloc();
     signInUseCase = MockSignInUseCase();

     signInBloc = SignInBloc(navigatorBloc: navigatorBloc, signInUseCase: signInUseCase);
     
   });
  testWidgets('Renders SignIn Screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<SignInBloc>(
              create: (context) => signInBloc,
            ),
            BlocProvider<NavigatorBloc>(
              create: (context) => navigatorBloc,
            ),
          ],
          child: SignIn(),
        ),
      ),
    );

    expect(find.byKey(Key('EmailTextField')), findsOneWidget);
    expect(find.byKey(Key('PasswordTextField')), findsOneWidget);
    expect(find.byKey(Key('SignInButton')), findsOneWidget);
    expect(find.byKey(Key('SignUpButton')), findsOneWidget);
  });

  tearDown(() {
    signInBloc.close();
    navigatorBloc.close();
  });
}