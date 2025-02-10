import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterTile extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isLoading;
  const FilterTile({
    super.key,
    required this.label,
    this.icon,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isLoading ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isLoading ? Colors.grey.shade500 : Colors.grey,
          width: 1,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: FaIcon(
                    icon,
                    color: isLoading ? Colors.grey.shade500 : Colors.black,
                    size: 14,
                  ),
                ),
              Text(
                label,
                style: TextStyle(
                  color: isLoading ? Colors.grey.shade500 : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
