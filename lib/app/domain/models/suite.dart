import 'package:equatable/equatable.dart';
import 'package:guia_moteis_go_teste/app/domain/models/categoria_item.dart';
import 'package:guia_moteis_go_teste/app/domain/models/item.dart';
import 'package:guia_moteis_go_teste/app/domain/models/periodo.dart';

class Suite extends Equatable {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<Item> itens;
  final List<CategoriaItem> categoriaItens;
  final List<Periodo> periodos;

  const Suite({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'],
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
      fotos: List<String>.from(json['fotos']),
      itens:
          (json['itens'] as List?)?.map((e) => Item.fromJson(e)).toList() ?? [],
      categoriaItens: (json['categoriaItens'] as List?)
              ?.map((e) => CategoriaItem.fromJson(e))
              .toList() ??
          [],
      periodos: (json['periodos'] as List?)
              ?.map((e) => Periodo.fromJson(e))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [
        nome,
        qtd,
        exibirQtdDisponiveis,
        fotos,
        itens,
        categoriaItens,
        periodos,
      ];
}
