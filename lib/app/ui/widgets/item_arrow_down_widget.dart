import 'package:flutter/material.dart';

class ItemArrowDownWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const ItemArrowDownWidget({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
