import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/view_all_widget.dart';

void main() {
  testWidgets('ViewAllWidget displays text correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ViewAllWidget(),
        ),
      ),
    );

    // Verifica se o texto 'ver\ntodos' está na tela
    expect(find.text('ver\ntodos'), findsOneWidget);
  });

  testWidgets('ViewAllWidget displays icon correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ViewAllWidget(),
        ),
      ),
    );

    // Verifica se o ícone de seta para baixo está na tela
    expect(find.byIcon(Icons.keyboard_arrow_down_outlined), findsOneWidget);
  });
}
