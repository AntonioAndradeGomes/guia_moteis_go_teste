import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/domain/models/suite.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/category_item_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/periods_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/suite_item_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/view_all_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../mock_response.dart';

void main() {
  testWidgets(
    'SuiteItemWidget display correctly',
    (WidgetTester tester) async {
      await mockNetworkImagesFor(() => _createWidget(tester, suiteTeste));

      // Verifica se a imagem foi carregada
      expect(find.byType(Image), findsNWidgets(3));

      // Verifica se o nome da suíte aparece
      expect(find.text('Suíte Luxo'), findsOneWidget);

      // Verifica se os itens de categoria são exibidos
      expect(find.byType(CategoryItemWidget), findsNWidgets(2));

      // Verifica se o botão "Ver Todos" aparece
      expect(find.byType(ViewAllWidget), findsOneWidget);

      // Verifica se os períodos são exibidos
      expect(find.byType(PeriodsWidget), findsOneWidget);
    },
  );
}

Future<void> _createWidget(WidgetTester tester, Suite suite) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SuiteItemWidget(
          suite: suite,
        ),
      ),
    ),
  );

  await tester.pump();
}
