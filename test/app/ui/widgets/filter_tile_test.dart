import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/filter_tile.dart';

void main() {
  testWidgets('displays label correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterTile(
            label: 'Test Label',
            isLoading: false,
          ),
        ),
      ),
    );

    expect(find.text('Test Label'), findsOneWidget);
  });

  testWidgets('does not display icon when not provided',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterTile(
            label: 'No Icon',
            isLoading: false,
          ),
        ),
      ),
    );

    expect(find.byType(Icon), findsNothing);
  });

  testWidgets('applies loading styles correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterTile(
            label: 'Loading',
            icon: FontAwesomeIcons.spinner,
            isLoading: true,
          ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('Loading'));
    expect(textWidget.style?.color, Colors.grey.shade500);

    final containerWidget = tester.widget<Container>(find.byType(Container));
    final decoration = containerWidget.decoration as BoxDecoration;
    expect(decoration.color, Colors.transparent);
  });
}
