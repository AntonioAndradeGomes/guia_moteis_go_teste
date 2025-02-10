import 'package:flutter/material.dart';
import 'package:guia_moteis_go_teste/app/domain/models/suite.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/category_item_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/periods_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/view_all_widget.dart';

class SuiteItemWidget extends StatelessWidget {
  final Suite suite;
  const SuiteItemWidget({
    super.key,
    required this.suite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    suite.fotos.first,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  suite.nome,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: suite.categoriaItens
                  .take(5)
                  .map<Widget>(
                    (e) => CategoryItemWidget(
                      categoria: e,
                    ),
                  )
                  .toList()
                ..add(
                  const ViewAllWidget(),
                ),
            ),
          ),
        ),
        ...suite.periodos.map(
          (p) => PeriodsWidget(item: p),
        )
      ],
    );
  }
}
