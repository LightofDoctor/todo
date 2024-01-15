import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/main.dart' as MyApp;

void main() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Test Firebase interaction on the fourth screen', (WidgetTester tester) async {
        await Firebase.initializeApp(); // Инициализация Firebase
        MyApp.main();

        final emailTextField = find.byKey(Key('emailTextField'));
        final passwordTextField = find.byKey(Key('passwordTextField'));
        final signInButton = find.byKey(Key('signInButton'));


        expect(emailTextField, findsOneWidget);
        expect(passwordTextField, findsOneWidget);
        expect(signInButton, findsOneWidget);

        await tester.enterText(emailTextField, 'losos2@gmail.com');
        await tester.enterText(passwordTextField, '1q2w3e4r5t');

        await tester.tap(find.byKey(const Key('signInButton')));
        await tester.pumpAndSettle();


        await tester.runAsync(() async {

            final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
                email: 'losos2@gmail.com',
                password: '1q2w3e4r5t',
            );
            await Future.delayed(Duration(seconds: 2));


            await tester.tap(find.byKey(Key('your_next_screen_button_key')));
            await tester.pumpAndSettle();
        });


        expect(find.byKey(Key('your_second_screen_key')), findsOneWidget);
    });
}