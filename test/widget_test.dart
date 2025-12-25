import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/ui/widgets/calculator_app_bar.dart';

void main() {
  testWidgets('CalculatorAppBar has a close button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(appBar: CalculatorAppBar(onUndo: () {})),
      ),
    );

    expect(find.byIcon(Icons.close), findsOneWidget);
  });
}
