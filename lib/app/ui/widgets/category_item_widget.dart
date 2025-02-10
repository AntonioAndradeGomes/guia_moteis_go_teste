import 'package:flutter/material.dart';
import 'package:guia_moteis_go_teste/app/domain/models/categoria_item.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoriaItem categoria;
  const CategoryItemWidget({
    super.key,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        categoria.icone,
        width: 35,
        height: 35,
      ),
    );
  }
}
