import 'dart:convert';
import 'package:guia_moteis_go_teste/app/data/exception/http_exception.dart';
import 'package:result_dart/result_dart.dart';
import 'package:http/http.dart' as http;

class ClientHttp {
  final http.Client _client;

  ClientHttp({
    required http.Client client,
  }) : _client = client;

  AsyncResult<Map<String, dynamic>> get(String url) async {
    try {
      final response = await _client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        return Success(data);
      }
      return Failure(
        HttpException(
          'Get failed',
          statusCode: response.statusCode,
        ),
      );
    } catch (e, s) {
      return Failure(
        HttpException(
          'Get failed',
          stackTrace: s,
        ),
      );
    }
  }
}
