import 'dart:convert';

class Model {
  String nome;
  int codigo;
  Model({
    this.nome,
    this.codigo,
  });

  Model copyWith({
    String nome,
    String codigo,
  }) {
    return Model(
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

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      nome: map['nome'],
      codigo: map['codigo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) => Model.fromMap(json.decode(source));

  @override
  String toString() => 'Models(nome: $nome, codigo: $codigo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Model && other.nome == nome && other.codigo == codigo;
  }

  @override
  int get hashCode => nome.hashCode ^ codigo.hashCode;
}
