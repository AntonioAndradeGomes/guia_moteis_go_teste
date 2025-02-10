import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/number_reviews_widget.dart';

void main() {
  testWidgets(
    'NumberReviewsWidget displays the correct number of reviews',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NumberReviewsWidget(reviews: 69),
          ),
        ),
      );

      expect(find.text('69 avaliações'), findsOneWidget);
      expect(find.byType(FaIcon), findsOneWidget);
    },
  );
}
