import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/app_app_bar_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:toggle_switch/toggle_switch.dart';

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

  testWidgets('renders AppAppBarWidget', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Guia Moteis'),
        ),
        body: BlocProvider<MoteisBloc>.value(
          value: moteisBloc,
          child: const AppAppBarWidget(),
        ),
      ),
    ));
    expect(find.byType(AppAppBarWidget), findsOneWidget);
    expect(find.byType(SafeArea), findsNWidgets(2));
    expect(find.byType(IconButton), findsNWidgets(2));
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(ToggleSwitch), findsOneWidget);
    expect(find.text('Maceió'), findsWidgets);
    expect(find.text('ir outro dia'), findsWidgets);
    expect(find.text('ir agora'), findsWidgets);
    expect(find.text('22 fev - 23 fev'), findsNothing);
  });

  testWidgets('renders AppAppBarWidget with date', (tester) async {
    when(() => moteisBloc.stream).thenAnswer(
      (_) => Stream.value(MoteisLoading(isNow: false)),
    );
    when(() => moteisBloc.state).thenReturn(MoteisLoading(isNow: false));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Guia Moteis'),
        ),
        body: BlocProvider<MoteisBloc>.value(
          value: moteisBloc,
          child: const AppAppBarWidget(),
        ),
      ),
    ));
    expect(find.byType(AppAppBarWidget), findsOneWidget);
    expect(find.byType(SafeArea), findsNWidgets(2));
    expect(find.byType(IconButton), findsNWidgets(2));
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(ToggleSwitch), findsOneWidget);
    expect(find.text('Maceió'), findsWidgets);
    expect(find.text('ir outro dia'), findsWidgets);
    expect(find.text('ir agora'), findsWidgets);
    expect(find.text('22 fev - 23 fev'), findsOneWidget);
  });
}
