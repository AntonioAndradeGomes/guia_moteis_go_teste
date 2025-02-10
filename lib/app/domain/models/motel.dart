import 'package:equatable/equatable.dart';
import 'package:guia_moteis_go_teste/app/domain/models/suite.dart';

class Motel extends Equatable {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final int qtdAvaliacoes;
  final double media;
  final List<Suite> suites;

  const Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.qtdAvaliacoes,
    required this.media,
    required this.suites,
  });

  factory Motel.fromJson(Map<String, dynamic> json) => Motel(
        fantasia: json['fantasia'] ?? '',
        logo: json['logo'] ?? '',
        bairro: json['bairro'] ?? '',
        distancia: (json['distancia'] ?? 0).toDouble(),
        qtdFavoritos: (json['qtdFavoritos'] ?? 0).toInt(),
        qtdAvaliacoes: (json['qtdAvaliacoes'] ?? 0).toInt(),
        media: (json['media'] ?? 0).toDouble(),
        suites:
            (json['suites'] as List?)?.map((x) => Suite.fromJson(x)).toList() ??
                [],
      );

  @override
  List<Object?> get props => [
        fantasia,
        logo,
        bairro,
        distancia,
        qtdFavoritos,
        qtdAvaliacoes,
        media,
        suites,
      ];
}
