import 'package:equatable/equatable.dart';

class CategoriaItem extends Equatable {
  final String nome;
  final String icone;

  const CategoriaItem({
    required this.nome,
    required this.icone,
  });

  factory CategoriaItem.fromJson(Map<String, dynamic> json) {
    return CategoriaItem(
      nome: json['nome'],
      icone: json['icone'],
    );
  }

  @override
  List<Object> get props => [nome, icone];
}
