class CarModel {
  final String nome;

  CarModel({required this.nome});

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      nome: json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
    };
  }
}