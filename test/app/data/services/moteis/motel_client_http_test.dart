import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/data/exception/http_exception.dart';

import 'package:guia_moteis_go_teste/app/data/services/client_http.dart';
import 'package:guia_moteis_go_teste/app/data/services/moteis/motel_client_http.dart';
import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../mock_response.dart';

class ClientHttpMock extends Mock implements ClientHttp {}

void main() {
  late ClientHttpMock clientHttp;
  late MotelClientHttp motelClientHttp;

  setUp(() {
    clientHttp = ClientHttpMock();
    motelClientHttp = MotelClientHttp(
      clientHttp: clientHttp,
    );
  });

  test('should return a MotelClientHttp instance', () async {
    when(() => clientHttp.get(any()))
        .thenAnswer((_) async => Success(mockResponse));

    final result = await motelClientHttp.getMoteis();

    expect(result, isA<Success>());
    final motels = result.getOrNull();
    expect(motels, isA<List<Motel>>());
    expect(motels?.length, 1);
  });

  test('should return a Failure', () async {
    final dioException = HttpException('Get failed', statusCode: 500);

    when(() => clientHttp.get(any()))
        .thenAnswer((_) async => Failure(dioException));

    final result = await motelClientHttp.getMoteis();
    expect(result, isA<Failure>());
    expect(result.getOrNull(), null);
    expect(result.exceptionOrNull(), isA<HttpException>());
  });
}
