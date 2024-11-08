import 'dart:convert';
import 'package:appfipeapi/marca.dart';
import 'package:appfipeapi/modelo.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://parallelum.com.br/fipe/api/v1/carros/marcas';

  Future<List<Marca>> getMarcas() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> modelosJson = jsonDecode(response.body);
      return modelosJson.map((dynamic item) {
        return Marca.fromJson(item);
      }).toList();
    }
    return [];
  }

  Future<List<Modelo>> getModelos() async {
    final response = await http.get(Uri.parse(
        'https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos'));

    if (response.statusCode == 200) {
      // Decodifica o JSON da resposta.
      var data = jsonDecode(response.body);
      // A chave 'modelos' contém a lista dos modelos de carro.
      List<dynamic> modelosJson = data['modelos'];

      // Mapeia a lista de modelos para uma lista de objetos CarModel.
      return modelosJson.map((dynamic item) {
        return Modelo.fromJson(item);
      }).toList();
    }
    return []; // Retorna uma lista vazia caso a requisição falhe.
  }
}
