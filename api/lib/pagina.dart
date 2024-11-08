import 'package:api/post.dart';
import 'package:flutter/material.dart';
import 'package:api/api_service.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final ApiService apiService = ApiService();
  List<CarModel> carModels = []; // Mudamos para CarModel.

  @override
  void initState() {
    _loadCarModels();
    super.initState();
  }

  void _loadCarModels() async {
    var aux = await apiService.getCarModels();
    setState(() {
      carModels = aux; // Agora atualizamos a lista com os CarModels.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modelos de Carros'),
        backgroundColor: const Color.fromARGB(255, 114, 184, 180),
      ),
      body: ListView.builder(
        itemCount: carModels.length,  // Agora usamos carModels.
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: ListTile(
              title: Text('${carModels[index].nome}'), // Exibe apenas o nome do modelo.
            ),
          );
        },
      ),
    );
  }
}
