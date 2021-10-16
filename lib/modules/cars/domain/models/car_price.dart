import 'dart:convert';

class CarPrice {
  dynamic valor;
  CarPrice({
    this.valor,
  });

  CarPrice copyWith({
    dynamic valor,
  }) {
    return CarPrice(
      valor: valor ?? this.valor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'valor': valor,
    };
  }

  factory CarPrice.fromMap(Map<String, dynamic> map) {
    return CarPrice(
      valor: map['Valor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CarPrice.fromJson(String source) =>
      CarPrice.fromMap(json.decode(source));

  @override
  String toString() => 'CarValue(valor: $valor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarPrice && other.valor == valor;
  }

  @override
  int get hashCode => valor.hashCode;
}
