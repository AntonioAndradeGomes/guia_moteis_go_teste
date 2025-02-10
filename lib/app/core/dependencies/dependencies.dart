import 'package:auto_injector/auto_injector.dart';
import 'package:guia_moteis_go_teste/app/data/repositories/moteis/motel_repository.dart';
import 'package:guia_moteis_go_teste/app/data/repositories/moteis/motel_repository_remote.dart';
import 'package:guia_moteis_go_teste/app/data/services/client_http.dart';
import 'package:guia_moteis_go_teste/app/data/services/moteis/motel_client_http.dart';
import 'package:http/http.dart' as http;

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton<http.Client>(http.Client.new);
  injector.addSingleton<ClientHttp>(ClientHttp.new);
  injector.addSingleton<MotelClientHttp>(MotelClientHttp.new);
  injector.addSingleton<MotelRepository>(MotelRepositoryRemote.new);
  injector.commit();
}
