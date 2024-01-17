import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_events.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_state.dart';
import 'package:todo/domain/usecase/sign_in_use_case.dart';

class MockSignInBloc extends Mock implements SignInBloc {}
class MockNavigatorBloc extends Mock implements NavigatorBloc {}
class MockSignInUseCase extends Mock implements SignInUseCase {}

void main() {
  late MockSignInBloc signInBloc;
  late MockSignInUseCase signInUseCase;
  late MockNavigatorBloc navigatorBloc;

  setUp(() {
    signInBloc = MockSignInBloc();
    signInUseCase = MockSignInUseCase();
    navigatorBloc = MockNavigatorBloc();
  });


    test('Add Event and Tap on SignIn Button', () async {
    when(signInUseCase.execute('losos@gmail.com', '1q2w3e4r5t')).thenAnswer((_) async => true);

    signInBloc.add(SignInEvent('losos@gmail.com', '1q2w3e4r5t'));
    await Future.delayed(Duration.zero);

    verify(signInBloc.add(SignInEvent('losos@gmail.com', '1q2w3e4r5t'))).called(1);

    await untilCalled(signInBloc.state);
    expectLater(signInBloc.state, isA<UserLoadedState>());
  });
  tearDown(() {
    signInBloc.close();
    navigatorBloc.close();
  });

}



