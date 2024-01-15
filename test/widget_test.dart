import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/main.dart';

void main() {
  testWidgets('Widget Test: SignIn Widget', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());

    final emailTextField = find.byKey(Key('emailTextField'));
    final passwordTextField = find.byKey(Key('passwordTextField'));
    final signInButton = find.byKey(Key('signInButton'));


    expect(emailTextField, findsOneWidget);
    expect(passwordTextField, findsOneWidget);
    expect(signInButton, findsOneWidget);


    await tester.enterText(emailTextField, 'test@example.com');
    await tester.enterText(passwordTextField, 'testpassword');


    await tester.tap(signInButton);
    await tester.pump();


    expect(find.text('Home'), findsOneWidget);
  });

}