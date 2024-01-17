import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_events.dart';
import 'package:todo/domain/usecase/sign_in_use_case.dart';
import 'package:todo/presentation/sign_in.dart';

class MockSignInBloc extends Mock implements SignInBloc {}

class MockNavigatorBloc extends Mock implements NavigatorBloc {}
class MockSignInUseCase extends Mock implements SignInUseCase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SignIn Widget Tests', () {
    late MockSignInBloc signInBloc;
    late MockNavigatorBloc navigatorBloc;
    late MockSignInUseCase signInUseCase;

    setUp(() {
      signInBloc = MockSignInBloc();
      navigatorBloc = MockNavigatorBloc();
      signInUseCase = MockSignInUseCase();
    });

    tearDown(() {
      signInBloc.close();
      navigatorBloc.close();
    });

    testWidgets('Renders SignIn Screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: signInBloc),
              BlocProvider.value(value: navigatorBloc),
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

    testWidgets('Tapping SignIn', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: signInBloc),
              BlocProvider.value(value: navigatorBloc),
            ],
            child: SignIn(),
          ),
        ),
      );

      when(signInUseCase.execute('losos@gmail.com', '1q2w3e4r5t')).thenAnswer((_) async => true);

      await tester.tap(find.byKey(Key('SignInButton')));
      await tester.pump();

      verify(signInBloc.add(SignInEvent('losos@gmail.com', '1q2w3e4r5t'))).called(1);
    });
  });
}