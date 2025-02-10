import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/domain/models/categoria_item.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/category_item_widget.dart';

import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('CategoryItemWidget displays the image correctly',
      (WidgetTester tester) async {
    const categoria = CategoriaItem(
      nome: 'Exemplo',
      icone: 'https://example.com/icon.png',
    );

    await mockNetworkImagesFor(() => _createWidget(tester, categoria));

    // Assert
    expect(find.byType(Image), findsOneWidget);
    final image = tester.widget<Image>(find.byType(Image));
    expect((image.image as NetworkImage).url, equals(categoria.icone));
  });
}

Future<void> _createWidget(WidgetTester tester, CategoriaItem categoria) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: CategoryItemWidget(categoria: categoria),
      ),
    ),
  );

  await tester.pump();
}
