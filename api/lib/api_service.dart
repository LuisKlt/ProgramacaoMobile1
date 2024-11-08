import 'dart:convert';
import 'package:api/post.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos';

  Future<List<CarModel>> getCarModels() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // Decodifica o JSON da resposta.
      var data = jsonDecode(response.body);
      // A chave 'modelos' contém a lista dos modelos de carro.
      List<dynamic> modelosJson = data['modelos'];

      // Mapeia a lista de modelos para uma lista de objetos CarModel.
      return modelosJson.map((dynamic item) {
        return CarModel.fromJson(item);
      }).toList();
    }
    return []; // Retorna uma lista vazia caso a requisição falhe.
  }
}
