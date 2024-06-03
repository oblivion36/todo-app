import 'package:dms/modules/todo_app/presentation/view/todo_page.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dms/main.dart' as app;

// Mock ToDoBloc
void main() {
  testWidgets('Login page validation test', (WidgetTester tester) async {
    app.main();
    initializeDependencies();
    await tester.pumpWidget(MaterialApp(home: CenteredButtonPage()));

    await tester.pumpAndSettle();

    await tester.tap(find.text('Submit'));

    await tester.pump();

    expect(find.text("Please enter a title"), findsNothing);
    expect(find.text("Please enter a description"), findsOneWidget);

    await tester.pump();
    await tester.enterText(find.byKey(const Key('title_field')), 'Saurabh');
    await tester.tap(find.text('Submit'));

    await tester.pump();
    expect(find.text("Please enter a title"), findsOneWidget);

    expect(find.text("Please enter a description"), findsOneWidget);
  });
}
