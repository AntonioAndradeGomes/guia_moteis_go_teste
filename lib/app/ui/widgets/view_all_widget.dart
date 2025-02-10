import 'package:flutter/material.dart';

class ViewAllWidget extends StatelessWidget {
  const ViewAllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Colors.grey,
      fontSize: 12,
    );
    return Row(
      children: [
        Text(
          'ver\ntodos',
          style: style,
          textAlign: TextAlign.end,
        ),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Colors.grey,
        )
      ],
    );
  }
}
