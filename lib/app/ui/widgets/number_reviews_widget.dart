import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumberReviewsWidget extends StatelessWidget {
  final int reviews;
  const NumberReviewsWidget({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$reviews avaliações',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        FaIcon(
          FontAwesomeIcons.chevronDown,
          color: Colors.black,
          size: 10,
        )
      ],
    );
  }
}
