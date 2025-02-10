import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis_go_teste/app/domain/models/desconto.dart';
import 'package:guia_moteis_go_teste/app/domain/models/periodo.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/periods_widget.dart';

void main() {
  testWidgets('It should display the formatted time and values ​​correctly.',
      (WidgetTester tester) async {
    // Arrange
    final periodo = Periodo(
      tempoFormatado: '2h',
      tempo: '120',
      valor: 100.00,
      valorTotal: 80.00,
      temCortesia: false,
      desconto: Desconto(desconto: 20.00),
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PeriodsWidget(item: periodo),
        ),
      ),
    );

    // Assert
    expect(find.text('2h'), findsOneWidget);
    expect(find.text('R\$ 100,00'), findsOneWidget);
    expect(find.text('R\$ 80,00'), findsOneWidget);
    expect(find.byType(FaIcon), findsOneWidget);
  });

  testWidgets('Should not display crossed out amount if there is no discount',
      (WidgetTester tester) async {
    // Arrange
    final periodo = Periodo(
      tempoFormatado: '1h',
      tempo: '60',
      valor: 50.00,
      valorTotal: 50.00,
      temCortesia: false,
      desconto: null,
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PeriodsWidget(item: periodo),
        ),
      ),
    );

    // Assert
    expect(find.text('1h'), findsOneWidget);
    expect(find.text('R\$ 50,00'), findsOneWidget);
    expect(find.text('R\$ 50,00', findRichText: true), findsOneWidget);
    expect(find.byType(FaIcon), findsOneWidget);
  });
}
