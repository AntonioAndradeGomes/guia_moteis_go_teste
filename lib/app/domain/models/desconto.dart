import 'package:equatable/equatable.dart';

class Desconto extends Equatable {
  final double desconto;

  const Desconto({
    required this.desconto,
  });

  factory Desconto.fromJson(Map<String, dynamic> json) {
    return Desconto(
      desconto: json['desconto'],
    );
  }

  @override
  List<Object> get props => [
        desconto,
      ];
}
