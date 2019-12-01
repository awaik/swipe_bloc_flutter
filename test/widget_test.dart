import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_swipes/main.dart';
import 'package:test_swipes/src/components/central_box.dart';
import 'package:test_swipes/src/components/squared_button.dart';

void main() {
  testWidgets('Swipe widgets tests', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.idle();
    await tester.pump(Duration.zero);

    // Check our widgets exists
    expect(
        find.byWidgetPredicate(
            (Widget widget) => widget is SquaredButton && widget.title == '-'),
        findsOneWidget);
    expect(find.widgetWithText(SquaredButton, '+'), findsOneWidget);
    expect(find.byWidgetPredicate((Widget widget) => widget is CentralBox),
        findsOneWidget);

    // Check that BLoC has initialised
    expect(find.widgetWithText(CentralBox, '1'), findsOneWidget);

    // Check that number increased / decreased
    await tester.tap(find.widgetWithText(SquaredButton, '+'));
    await tester.pump(Duration.zero);
    expect(find.widgetWithText(CentralBox, '1'), findsOneWidget);
  });
}
