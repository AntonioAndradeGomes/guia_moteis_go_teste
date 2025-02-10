import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/stars_rating_widget.dart';

void main() {
  testWidgets(
      'StarsRatingWidget exibe corretamente a nota e o ícone de estrela',
      (WidgetTester tester) async {
    const double rating = 4.5;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StarsRatingWidget(rating: rating),
        ),
      ),
    );

    expect(find.text('4.5'), findsOneWidget);

    expect(find.byIcon(Icons.star), findsOneWidget);
    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.border, isNotNull);
    expect(decoration.border!.top.color, Colors.orangeAccent);
    expect(decoration.borderRadius, BorderRadius.circular(10));
  });
}
