class Pessoa {
  int? id;
  String nome;
  String cpf;
  String cartao;

  Pessoa({
    this.id,
    required this.nome,
    required this.cpf,
    required this.cartao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'cartao': cartao,
    };
  }

  factory Pessoa.fromMap(Map<String, dynamic> map) {
    return Pessoa(
      nome: map['nome'],
      cpf: map['cpf'],
      cartao: map['cartao'],
    );
  }
}
