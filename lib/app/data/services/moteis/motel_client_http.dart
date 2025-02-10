import 'package:guia_moteis_go_teste/app/core/constants/constants.dart';
import 'package:guia_moteis_go_teste/app/data/services/client_http.dart';
import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';
import 'package:result_dart/result_dart.dart';

class MotelClientHttp {
  final ClientHttp _clientHttp;

  MotelClientHttp({
    required ClientHttp clientHttp,
  }) : _clientHttp = clientHttp;

  AsyncResult<List<Motel>> getMoteis() async {
    final response = await _clientHttp.get(Constants.backendUrl);

    return response.map((value) => (value['data']['moteis'] as List)
        .map((e) => Motel.fromJson(e))
        .toList());
  }
}
