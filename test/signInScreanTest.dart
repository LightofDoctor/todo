import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/presentation/sign_in.dart';

void main() {
  group('SignIn Screen Widget Tests', () {
    testWidgets('Test if emailTextField is present', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignIn()));

      expect(find.byKey(Key('emailTextField')), findsOneWidget);
    });

    testWidgets('Test if passwordTextField is present', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignIn()));

      expect(find.byKey(Key('passwordTextField')), findsOneWidget);
    });

    testWidgets('Test if signInButton is present', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignIn()));

      expect(find.byKey(Key('signInButton')), findsOneWidget);
    });
  });
}