import 'dart:convert';

class Car {
  num id;
  String fabricante;
  String modelo;
  int ano;
  num valorFipe;
  Car({
    this.id,
    this.fabricante,
    this.modelo,
    this.ano,
    this.valorFipe,
  });

  Car copyWith({
    num id,
    String fabricante,
    String modelo,
    int ano,
    num valorFipe,
  }) {
    return Car(
      id: id ?? this.id,
      fabricante: fabricante ?? this.fabricante,
      modelo: modelo ?? this.modelo,
      ano: ano ?? this.ano,
      valorFipe: valorFipe ?? this.valorFipe,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fabricante': fabricante,
      'modelo': modelo,
      'ano': ano,
      'valorFipe': valorFipe,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'],
      fabricante: map['fabricante'],
      modelo: map['modelo'],
      ano: map['ano'],
      valorFipe: map['valorFipe'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Car(id: $id, fabricante: $fabricante, modelo: $modelo, ano: $ano, valorFipe: $valorFipe)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Car &&
        other.id == id &&
        other.fabricante == fabricante &&
        other.modelo == modelo &&
        other.ano == ano &&
        other.valorFipe == valorFipe;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fabricante.hashCode ^
        modelo.hashCode ^
        ano.hashCode ^
        valorFipe.hashCode;
  }
}
