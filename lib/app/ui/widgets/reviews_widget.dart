import 'package:flutter/material.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/number_reviews_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/stars_rating_widget.dart';

class ReviewsWidget extends StatelessWidget {
  final double rating;
  final int reviews;
  const ReviewsWidget({
    super.key,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarsRatingWidget(
          rating: rating,
        ),
        const SizedBox(
          width: 10,
        ),
        NumberReviewsWidget(
          reviews: reviews,
        ),
      ],
    );
  }
}
