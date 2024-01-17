import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_events.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_state.dart';
import 'package:todo/domain/usecase/sign_in_use_case.dart';

import 'unitTest.mocks.dart';


@GenerateNiceMocks([MockSpec<SignInUseCase>(), MockSpec<NavigatorBloc>()])




void main() {

  late SignInBloc signInBloc;
  late MockSignInUseCase signInUseCase;
  late MockNavigatorBloc navigatorBloc;

  setUp(() {
    signInUseCase = MockSignInUseCase();
    navigatorBloc = MockNavigatorBloc();
    signInBloc  = SignInBloc(navigatorBloc: navigatorBloc, signInUseCase: signInUseCase);

  });


    test('Add Event and Tap on SignIn Button', () async {
    when(signInUseCase.execute('losos@gmail.com', '1q2w3e4r5t')).thenAnswer((_) async => true);

    signInBloc.add(SignInEvent('losos@gmail.com', '1q2w3e4r5t'));
    await Future.delayed(Duration.zero);

    verify(signInUseCase.execute(any, any)).called(1);

  });

  test('Add SignInEvent and expect UserLoadedState', () async {
    when(signInUseCase.execute('losos@gmail.com', '1q2w3e4r5t')).thenAnswer((_) async => true);

    signInBloc.add(SignInEvent('losos@gmail.com', '1q2w3e4r5t'));


    await Future.delayed(Duration.zero);


    expect(signInBloc.state, isA<UserLoadedState>());
  });

  tearDown(() {
    signInBloc.close();
    navigatorBloc.close();
  });

}



