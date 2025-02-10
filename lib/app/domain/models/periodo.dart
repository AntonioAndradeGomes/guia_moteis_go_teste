import 'package:equatable/equatable.dart';
import 'package:guia_moteis_go_teste/app/domain/models/desconto.dart';

class Periodo extends Equatable {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final Desconto? desconto;

  const Periodo({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    required this.desconto,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'],
      tempo: json['tempo'],
      valor: json['valor'],
      valorTotal: json['valorTotal'],
      temCortesia: json['temCortesia'],
      desconto:
          json['desconto'] == null ? null : Desconto.fromJson(json['desconto']),
    );
  }

  @override
  List<Object?> get props => [
        tempoFormatado,
        tempo,
        valor,
        valorTotal,
        temCortesia,
        desconto,
      ];
}
