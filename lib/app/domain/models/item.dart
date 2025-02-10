import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String nome;

  const Item({
    required this.nome,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        nome: json["nome"],
      );

  @override
  List<Object> get props => [nome];
}
