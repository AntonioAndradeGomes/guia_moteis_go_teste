import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/item_arrow_down_widget.dart';

void main() {
  testWidgets(
    'ItemArrowDownWidget display correctly',
    (WidgetTester tester) async {
      const label = 'Suíte Luxo';
      bool taped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ItemArrowDownWidget(
              label: label,
              onTap: () {
                taped = true;
              },
            ),
          ),
        ),
      );
      final itemArrowDownWidget = find.byType(ItemArrowDownWidget);
      expect(itemArrowDownWidget, findsOneWidget);
      final itemArrowDown =
          tester.widget<ItemArrowDownWidget>(itemArrowDownWidget);
      expect(itemArrowDown.label, equals(label));
      await tester.tap(itemArrowDownWidget);
      expect(taped, true);
    },
  );
}
