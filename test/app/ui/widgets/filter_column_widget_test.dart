import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/filter_column_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/filter_tile.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock.dart';

void main() {
  late MoteisBloc moteisBloc;

  setUp(() {
    moteisBloc = MockMoteisBloc();
    when(() => moteisBloc.stream).thenAnswer(
      (_) => Stream.value(MoteisLoading()),
    );
    when(() => moteisBloc.state).thenReturn(MoteisLoading());
    when(() => moteisBloc.close()).thenAnswer((_) async {});
  });

  testWidgets('renders FilterColumnWidget', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<MoteisBloc>.value(
          value: moteisBloc,
          child: FilterColumnWidget(),
        ),
      ),
    ));
    expect(find.byType(FilterColumnWidget), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(FilterTile), findsWidgets);
    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets('display icon in frist FilterTile', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<MoteisBloc>.value(
          value: moteisBloc,
          child: FilterColumnWidget(),
        ),
      ),
    ));
    expect(find.byType(FilterColumnWidget), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    final firstFilterTile = find.byType(FilterTile).first;
    final firstFilterTileIcon = tester.widget<FilterTile>(firstFilterTile).icon;
    expect(firstFilterTileIcon, equals(FontAwesomeIcons.sliders));
    final otherFilterTiles = find.byType(FilterTile).evaluate().skip(1);
    for (final element in otherFilterTiles) {
      final filterTile = element.widget as FilterTile;
      expect(filterTile.icon, isNull);
    }
  });

  testWidgets('display loading state correctly', (tester) async {
    when(() => moteisBloc.stream).thenAnswer(
      (_) => Stream.value(MoteisLoading()),
    );
    when(() => moteisBloc.state).thenReturn(MoteisLoading());
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<MoteisBloc>.value(
          value: moteisBloc,
          child: FilterColumnWidget(),
        ),
      ),
    ));

    final filterTiles = find.byType(FilterTile).evaluate();
    for (final element in filterTiles) {
      final filterTile = element.widget as FilterTile;
      expect(filterTile.isLoading, isTrue);
    }
  });
}
