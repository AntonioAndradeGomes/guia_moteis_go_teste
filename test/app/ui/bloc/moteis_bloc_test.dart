import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/data/exception/http_exception.dart';
import 'package:guia_moteis_go_teste/app/data/repositories/moteis/motel_repository.dart';
import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';
import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

class MockMotelRepository extends Mock implements MotelRepository {}

void main() {
  late MockMotelRepository mockMotelRepository;
  late MoteisBloc bloc;

  setUp(() {
    mockMotelRepository = MockMotelRepository();
    bloc = MoteisBloc(
      motelRepository: mockMotelRepository,
    );
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state is MoteisLoading', () {
    expect(bloc.state, equals(MoteisLoading(isNow: true)));
  });

  test('emits MoteisSuccess when GetAllMotels returns Success', () async {
    final mockMotels = [
      Motel(
        fantasia: 'Motel A',
        logo: 'logo_url',
        bairro: 'Bairro A',
        distancia: 10.0,
        qtdFavoritos: 5,
        qtdAvaliacoes: 10,
        media: 4.5,
        suites: [],
      ),
    ];

    when(() => mockMotelRepository.getAllMotels()).thenAnswer(
      (_) async => Success(mockMotels),
    );

    final act = MoteisFetch(isNow: false);

    expect(act.props.length, 1);

    // Act
    bloc.add(act);

    // Assert
    await expectLater(
      bloc.stream,
      emitsInOrder([
        MoteisLoading(isNow: false),
        MoteisSuccess(mockMotels, isNow: false),
      ]),
    );
  });

  test('emits MoteisError when GetAllMotels returns Failure', () async {
    final httpException = HttpException('Error', statusCode: 500);

    when(() => mockMotelRepository.getAllMotels()).thenAnswer(
      (_) async => Failure(httpException),
    );

    // Act
    bloc.add(MoteisFetch());

    // Assert
    await expectLater(
      bloc.stream,
      emitsInOrder([
        MoteisLoading(),
        MoteisError(httpException),
      ]),
    );
  });
}
