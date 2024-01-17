import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo/domain/bloc/navigator_bloc.dart';
import 'package:todo/domain/bloc/read_data_users/read_data_users_bloc.dart';
import 'package:todo/domain/bloc/sign_in/sign_in_bloc.dart';
import 'package:todo/main.dart' as MyApp;
import 'package:mockito/mockito.dart';
class MockSignInBloc extends Mock implements SignInBloc {}
class MockNavigatorBloc extends Mock implements NavigatorBloc {}
class MockQuestionBloc extends Mock implements QuestionListBloc {}
void main() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Test SignInScrean', (WidgetTester tester) async {
        MyApp.main(

        );
        await tester.pumpAndSettle(Duration(seconds: 3));
        final emailTextField = find.byKey(Key('EmailTextField'));
        final passwordTextField = find.byKey(Key('PasswordTextField'));
        final signInButton = find.byKey(Key('SignInButton'));
        final signUpButton = find.byKey(Key('SignUpButton'));
        expect(emailTextField, findsOneWidget);
        expect(passwordTextField, findsOneWidget);
        expect(signInButton, findsOneWidget);
        expect(signUpButton, findsOneWidget);
        await tester.enterText(find.byKey(Key('EmailTextField')), 'losos2@gmail.com');
        await tester.enterText(find.byKey(Key('PasswordTextField')), '1q2w3e4r5t');
        await tester.pumpAndSettle(Duration(seconds: 3));
        await tester.tapAt(Offset(200, 100));
        await tester.pumpAndSettle(Duration(seconds: 5));
        await tester.tap(find.byKey(Key('SignInButton')));
        await tester.pumpAndSettle(Duration(seconds: 3));

    });
}