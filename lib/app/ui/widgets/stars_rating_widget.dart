import 'package:flutter/material.dart';

class StarsRatingWidget extends StatelessWidget {
  final double rating;
  const StarsRatingWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.orangeAccent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.orangeAccent,
            size: 14,
          ),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
