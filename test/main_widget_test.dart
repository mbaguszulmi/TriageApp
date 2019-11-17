// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:triage/main.dart';

void main() {
  testWidgets('Test All App Widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.pump();

    print('TESTING LOGIN PAGE...');

    expect(find.text('IMPROVING DIAGNOSIS IN TRIAGE'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pump();

    expect(find.byIcon(Icons.visibility), findsNothing);
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);

    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('No space allowed'), findsNothing);
    expect(find.text('Please fill this field'), findsOneWidget);
    expect(find.text('Enter password at least 8 characters'), findsOneWidget);

    await tester.enterText(find.byKey(Key('UsernameField')), 'this is a username');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('No space allowed'), findsOneWidget);
    expect(find.text('Please fill this field'), findsNothing);
    expect(find.text('Enter password at least 8 characters'), findsOneWidget);

    await tester.enterText(find.byKey(Key('UsernameField')), 'usernametest');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('No space allowed'), findsNothing);
    expect(find.text('Please fill this field'), findsNothing);
    expect(find.text('Enter password at least 8 characters'), findsOneWidget);

    await tester.enterText(find.byKey(Key('PasswordField')), 'passwordtest');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('No space allowed'), findsNothing);
    expect(find.text('Please fill this field'), findsNothing);
    expect(find.text('Enter password at least 8 characters'), findsNothing);

    print('TESTING MAIN PAGE...');

    await tester.pump(Duration(milliseconds: 5000));

    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.add_box), findsOneWidget);
    expect(find.byIcon(Icons.history), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.bySemanticsLabel('Barcode Icon'), findsOneWidget);
  });
}
