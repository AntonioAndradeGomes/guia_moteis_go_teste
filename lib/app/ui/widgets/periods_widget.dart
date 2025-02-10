import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis_go_teste/app/domain/models/periodo.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/discount_widget.dart';

class PeriodsWidget extends StatelessWidget {
  final Periodo item;
  const PeriodsWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.tempoFormatado,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      if (item.desconto != null)
                        DiscountWidget(
                          desconto: item.desconto!,
                          price: item.valor,
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      if (item.desconto != null)
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: Text(
                            'R\$ ${item.valor.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey,
                            ),
                          ),
                        ),
                      Text(
                        'R\$ ${item.valorTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FaIcon(
              Icons.keyboard_arrow_right_outlined,
            )
          ],
        ),
      ),
    );
  }
}
