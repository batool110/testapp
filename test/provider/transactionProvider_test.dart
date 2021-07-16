import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/widgets/transactionList.dart';

void main() {
  group("scrollableTransactionList", () {
    testWidgets("transactionList", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: TransactionList(
              List.generate(5, (index) => print("Transaction $index")))));

      await tester.drag(find.byType(ListView), const Offset(0, -300));
      await tester.pump();

      final firstTransactionFinder = find.byWidget(Column());
      expect(firstTransactionFinder, findsOneWidget);
    });
  });
}
