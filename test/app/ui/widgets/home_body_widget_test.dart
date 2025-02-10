import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/data/exception/http_exception.dart';
import 'package:guia_moteis_go_teste/app/domain/models/categoria_item.dart';
import 'package:guia_moteis_go_teste/app/domain/models/item.dart';
import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';
import 'package:guia_moteis_go_teste/app/domain/models/periodo.dart';
import 'package:guia_moteis_go_teste/app/domain/models/suite.dart';
import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/home_body_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/motel_item_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

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

  createWidget(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider<MoteisBloc>.value(
          value: moteisBloc,
          child: Column(
            children: [
              HomeBodyWidget(),
            ],
          ),
        ),
      ),
    ));
    await tester.pump();
  }

  testWidgets('Display CircularProgressIndicator when loading', (tester) async {
    await createWidget(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Display error when there is a failure', (tester) async {
    when(() => moteisBloc.state)
        .thenReturn(MoteisError(HttpException('Error message')));
    when(() => moteisBloc.stream).thenAnswer(
        (_) => Stream.value(MoteisError(HttpException('Error message'))));

    await createWidget(tester);
    expect(find.text('Error message'), findsOneWidget);
  });

  testWidgets('Display list of motels when success', (tester) async {
    final moteis = [
      Motel(
        fantasia: 'Motel A',
        logo: 'logo_url',
        bairro: 'Bairro A',
        distancia: 10.0,
        qtdFavoritos: 5,
        qtdAvaliacoes: 10,
        media: 4.5,
        suites: [
          Suite(
            nome: 'Suíte Luxo',
            qtd: 2,
            exibirQtdDisponiveis: true,
            fotos: [
              'https://example.com/image.jpg'
            ], // URL fake, mas ignorada nos testes
            itens: [
              Item(
                nome: 'Sauna',
              ),
              Item(
                nome: 'Piscina',
              ),
            ],
            categoriaItens: [
              CategoriaItem(
                nome: 'Piscina',
                icone: 'https://example.com/icon1.png',
              ),
              CategoriaItem(
                nome: 'Sauna',
                icone: 'https://example.com/icon2.png',
              ),
            ],
            periodos: [
              Periodo(
                tempoFormatado: '2h',
                tempo: '120',
                valor: 200.0,
                valorTotal: 150.0,
                temCortesia: false,
                desconto: null,
              ),
            ],
          )
        ],
      ),
      Motel(
        fantasia: 'Motel B',
        logo: 'logo_url',
        bairro: 'Bairro A',
        distancia: 10.0,
        qtdFavoritos: 5,
        qtdAvaliacoes: 10,
        media: 4.5,
        suites: [
          Suite(
            nome: 'Suíte Luxo',
            qtd: 2,
            exibirQtdDisponiveis: true,
            fotos: [
              'https://example.com/image.jpg'
            ], // URL fake, mas ignorada nos testes
            itens: [
              Item(
                nome: 'Sauna',
              ),
              Item(
                nome: 'Piscina',
              ),
            ],
            categoriaItens: [
              CategoriaItem(
                nome: 'Piscina',
                icone: 'https://example.com/icon1.png',
              ),
              CategoriaItem(
                nome: 'Sauna',
                icone: 'https://example.com/icon2.png',
              ),
            ],
            periodos: [
              Periodo(
                tempoFormatado: '2h',
                tempo: '120',
                valor: 200.0,
                valorTotal: 150.0,
                temCortesia: false,
                desconto: null,
              ),
            ],
          )
        ],
      ),
    ];

    when(() => moteisBloc.state).thenReturn(MoteisSuccess(moteis, isNow: true));
    when(() => moteisBloc.stream)
        .thenAnswer((_) => Stream.value(MoteisSuccess(moteis, isNow: true)));

    await mockNetworkImagesFor(() => createWidget(tester));
    expect(find.byType(HomeBodyWidget), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Motel A'), findsOneWidget);
    expect(find.text('Motel B'), findsOneWidget);
    expect(find.byType(MotelItemWidget), findsNWidgets(2));
  });
}
