import 'dart:convert';

class Brand {
  String nome;
  String codigo;
  Brand({
    this.nome,
    this.codigo,
  });

  Brand copyWith({
    String nome,
    String codigo,
  }) {
    return Brand(
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

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      nome: map['nome'],
      codigo: map['codigo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) => Brand.fromMap(json.decode(source));

  @override
  String toString() => 'Brand(nome: $nome, codigo: $codigo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Brand && other.nome == nome && other.codigo == codigo;
  }

  @override
  int get hashCode => nome.hashCode ^ codigo.hashCode;
}
