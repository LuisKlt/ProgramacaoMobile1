class Destino {
  int? id;
  String nomeDestino;
  double distanciaDestino;
  
  Destino({
    this.id,
    required this.nomeDestino,
    required this.distanciaDestino,
  });

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'nomeDestino': nomeDestino,
      'distanciaDestino': distanciaDestino,
    };
  }

  factory Destino.fromMap(Map<String, dynamic> map){
    return Destino(
      id: map['id'],
      nomeDestino: map['nomeDestino'], 
      distanciaDestino: map['distanciaDestino'],
    );
  }
}
