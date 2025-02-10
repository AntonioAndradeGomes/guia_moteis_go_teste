import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/data/exception/http_exception.dart';
import 'package:guia_moteis_go_teste/app/data/repositories/moteis/motel_repository.dart';
import 'package:guia_moteis_go_teste/app/data/repositories/moteis/motel_repository_remote.dart';
import 'package:guia_moteis_go_teste/app/data/services/moteis/motel_client_http.dart';
import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../mock_response.dart';

class MotelClientHttpMock extends Mock implements MotelClientHttp {}

void main() {
  late MotelClientHttpMock motelClientHttp;
  late MotelRepository repository;

  setUp(() {
    motelClientHttp = MotelClientHttpMock();
    repository = MotelRepositoryRemote(
      motelClientHttp: motelClientHttp,
    );
  });

  test(
    'should return a list of motels',
    () async {
      final moteisResponse =
          (mockMoteis as List).map((e) => Motel.fromJson(e)).toList();
      when(() => motelClientHttp.getMoteis()).thenAnswer(
        (_) async => Success(moteisResponse),
      );

      final result = await repository.getAllMotels();
      expect(result, isA<Success>());
      final motels = result.getOrNull();
      expect(motels, isA<List<Motel>>());
      expect(motels?.length, 1);
      final motel = motels!.first;
      expect(motel.props.length, 8);
      expect(motel.fantasia, "Motel Le Nid");
      expect(motel.logo,
          "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif");
      expect(motel.bairro, "Chácara Flora - São Paulo");
      expect(motel.distancia, 28.27);
      expect(motel.qtdFavoritos, 0);
      expect(motel.qtdAvaliacoes, 2159);
      expect(motel.media, 4.6);
      expect(motel.suites.length, 1);
      final suites = motel.suites;
      expect(suites.length, 1);
      final suite = suites.first;
      expect(suite.nome, "Suíte Marselha s/ garagem privativa");
      expect(suite.fotos.length, 4);
      expect(suite.qtd, 1);
      expect(suite.exibirQtdDisponiveis, true);
      expect(
        suite.fotos.first,
        "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
      );
      expect(suite.itens.length, 14);
      final itens = suite.itens;
      expect(itens.first.props.length, 1);
      expect(itens.length, 14);
      expect(itens[0].nome, "ducha dupla");
      expect(itens[1].nome, "TV a cabo");
      expect(itens[2].nome, "TV LED 32''");
      expect(itens[3].nome, "iluminação por leds");
      expect(itens[4].nome, "garagem coletiva");
      expect(itens[5].nome, "som AM/FM");
      expect(itens[6].nome, "3 canais eróticos");
      expect(itens[7].nome, "bluetooth");
      expect(itens[8].nome, "espelho no teto");
      expect(itens[9].nome, "acesso à suíte via escadas");
      expect(itens[10].nome, "frigobar");
      expect(itens[11].nome, "ar-condicionado split");
      expect(itens[12].nome, "WI-FI");
      expect(itens[13].nome, "secador de cabelo");
      expect(suite.categoriaItens.length, 4);
      expect(suite.periodos.length, 3);
      expect(suite.props.length, 7);
      expect(suite.periodos.first.props.length, 6);

      final suiteCategoriasIcons = suite.categoriaItens.first;
      expect(suiteCategoriasIcons.nome, "Frigobar");
      expect(suiteCategoriasIcons.props.length, 2);
    },
  );

  test(
    'should return an error',
    () async {
      when(() => motelClientHttp.getMoteis()).thenAnswer(
        (_) async => Failure(
          HttpException(
            'Error',
            statusCode: 500,
            stackTrace: StackTrace.current,
          ),
        ),
      );

      final result = await repository.getAllMotels();
      expect(result, isA<Failure>());
      expect(result.exceptionOrNull(), isA<HttpException>());
      final excep = (result.exceptionOrNull() as HttpException);
      expect(excep.statusCode, 500);
      expect(excep.message, 'Error');
    },
  );
}
