import 'package:flutter/material.dart';
import 'package:guia_moteis_go_teste/app/domain/models/desconto.dart';

class DiscountWidget extends StatelessWidget {
  final Desconto desconto;
  final double price;
  const DiscountWidget({
    super.key,
    required this.desconto,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 5,
      ),
      child: Text(
        '${(desconto.desconto / price * 100).toStringAsFixed(0)}% off',
        style: const TextStyle(
          fontSize: 12,
          color: Colors.teal,
        ),
      ),
    );
  }
}
