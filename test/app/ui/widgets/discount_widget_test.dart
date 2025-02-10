import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/domain/models/desconto.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/discount_widget.dart';

void main() {
  testWidgets('DiscountWidget displays discount correctly',
      (WidgetTester tester) async {
    // Arrange
    const desconto = Desconto(desconto: 20);
    const price = 100.0;
    final expectedPercentage =
        (desconto.desconto / price * 100).toStringAsFixed(0);

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DiscountWidget(desconto: desconto, price: price),
        ),
      ),
    );

    // Assert
    expect(find.text('$expectedPercentage% off'), findsOneWidget);
    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.border?.top.color, Colors.teal);
    expect(decoration.borderRadius, BorderRadius.circular(15));
    expect(desconto.props.length, 1);
  });
}
