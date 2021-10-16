import 'dart:convert';

class CarYear {
  String nome;
  dynamic codigo;
  CarYear({
    this.nome,
    this.codigo,
  });

  CarYear copyWith({
    String nome,
    dynamic codigo,
  }) {
    return CarYear(
      nome: nome ?? this.nome,
      codigo: codigo ?? this.codigo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'codigo': codigo,
    };
  }

  factory CarYear.fromMap(Map<String, dynamic> map) {
    return CarYear(
      nome: map['nome'],
      codigo: map['codigo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CarYear.fromJson(String source) =>
      CarYear.fromMap(json.decode(source));

  @override
  String toString() => 'CarYear(nome: $nome, codigo: $codigo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarYear && other.nome == nome && other.codigo == codigo;
  }

  @override
  int get hashCode => nome.hashCode ^ codigo.hashCode;
}
