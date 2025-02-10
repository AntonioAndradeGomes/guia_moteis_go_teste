import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/data/exception/http_exception.dart';
import 'package:guia_moteis_go_teste/app/data/services/client_http.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

class MockClientHttp extends Mock implements http.Client {}

void main() {
  late MockClientHttp mockClientHttp;
  late ClientHttp clientHttp;

  setUp(() {
    mockClientHttp = MockClientHttp();
    clientHttp = ClientHttp(client: mockClientHttp);
  });
  test('deve retornar Success quando a resposta for 200', () async {
    final url = 'https://api.example.com/moteis';
    final mockResponse = jsonEncode({'key': 'value'});

    when(() => mockClientHttp.get(Uri.parse(url)))
        .thenAnswer((_) async => http.Response(mockResponse, 200));

    final result = await clientHttp.get(url);

    expect(result, isA<Success>());
    final data = result.getOrNull();
    expect(data, isA<Map<String, dynamic>>());
    expect(data?['key'], 'value');
  });

  test('should return failure on non-200 response', () async {
    final url = 'https://api.example.com/moteis';

    when(() => mockClientHttp.get(Uri.parse(url)))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    final result = await clientHttp.get(url);

    expect(result, isA<Failure>());
    final excp = result.exceptionOrNull() as HttpException;
    expect(excp.message, 'Get failed');
    expect(excp.statusCode, 404);
  });

  test('should return failure on exception', () async {
    // Arrange
    final url = 'https://api.example.com/moteis';

    // Set up mock client to throw an exception
    when(() => mockClientHttp.get(Uri.parse(url)))
        .thenThrow(Exception('Network error'));

    // Act
    final result = await clientHttp.get(url);

    // Assert
    expect(result, isA<Failure>());
    final failure = result.exceptionOrNull() as HttpException?;
    expect(failure?.message, 'Get failed');
  });
}
