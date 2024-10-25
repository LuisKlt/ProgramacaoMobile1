class Carro {
  int? id;
  String nomeCarro;
  double autonomia;
  
  Carro({
    this.id,
    required this.nomeCarro,
    required this.autonomia,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeCarro': nomeCarro,
      'autonomia': autonomia,
    };
  }

  factory Carro.fromMap(Map<String, dynamic> map) {
    return Carro(
      id: map['id'],
      nomeCarro: map['nomeCarro'],
      autonomia: map['autonomia'],
    );
  }

}
