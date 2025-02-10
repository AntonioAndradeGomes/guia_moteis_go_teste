import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/number_reviews_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/reviews_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/stars_rating_widget.dart';

void main() {
  testWidgets(
      'deve exibir a classificação e o número de avaliações corretamente',
      (WidgetTester tester) async {
    const double rating = 4.5;
    const int reviews = 123;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReviewsWidget(
            rating: rating,
            reviews: reviews,
          ),
        ),
      ),
    );

    final starsRatingWidget = find.byType(StarsRatingWidget);
    expect(starsRatingWidget, findsOneWidget);

    final starsRating = tester.widget<StarsRatingWidget>(starsRatingWidget);
    expect(starsRating.rating, equals(rating));

    final numberReviewsWidget = find.byType(NumberReviewsWidget);
    expect(numberReviewsWidget, findsOneWidget);

    final numberReviews =
        tester.widget<NumberReviewsWidget>(numberReviewsWidget);
    expect(numberReviews.reviews, equals(reviews));
    final rowWidget = find.byType(Row).first;
    expect(rowWidget, findsOneWidget);
    final rowChildren = tester.widget<Row>(rowWidget).children;
    expect(rowChildren.length, equals(3));
    expect(rowChildren[0], isA<StarsRatingWidget>());
    expect(rowChildren[1], isA<SizedBox>());
    expect(rowChildren[2], isA<NumberReviewsWidget>());
  });
}
