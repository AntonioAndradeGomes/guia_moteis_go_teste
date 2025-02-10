import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/pages/home_page.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/app_app_bar_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/filter_column_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/home_body_widget.dart';
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

  testWidgets('Deve renderizar a HomePage corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MoteisBloc>(
          create: (context) => moteisBloc,
          child: const HomePage(),
        ),
      ),
    );

    // Verifica se o FloatingActionButton é renderizado
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text('Mapa'), findsOneWidget);
    expect(find.byType(AppAppBarWidget), findsOneWidget);
    expect(find.byType(FilterColumnWidget), findsOneWidget);
    expect(find.byType(HomeBodyWidget), findsOneWidget);
    await tester.tap(find.byType(FloatingActionButton));
  });
}
