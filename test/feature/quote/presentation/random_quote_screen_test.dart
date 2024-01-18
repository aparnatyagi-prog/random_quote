
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_quote/feature/quote/presentation/screen/quote_screen.dart';
import 'package:random_quote/main.dart';

void main() {
  testWidgets('renders RandomQuoteScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    // Verify that our counter starts at 0.
    expect(find.byType(QuoteScreen), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(QuoteScreen), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });
}