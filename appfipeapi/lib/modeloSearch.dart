import 'package:appfipeapi/apiService.dart';
import 'package:appfipeapi/marcaSearch.dart';
import 'package:appfipeapi/modelo.dart';
import 'package:flutter/material.dart';

class ModeloSearch extends StatefulWidget {
  const ModeloSearch({super.key});

  @override
  ModeloSearchState createState() => ModeloSearchState();
}

class ModeloSearchState extends State<ModeloSearch> {
  final ApiService apiService = ApiService();
  List<Modelo> allBrands = [];
  List<Modelo> filteredBrands = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCarBrands();
    searchController.addListener(_filterBrands);
  }

  Future<void> _loadCarBrands() async {
    allBrands = await apiService.getModelos();
    setState(() {
      filteredBrands = allBrands;
    });
  }

  void _filterBrands() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredBrands = allBrands.where((brand) {
        final brandName = brand.nome.toLowerCase();
        return brandName.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesquisar Modelos')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar modelo',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBrands.length,
              itemBuilder: (context, index) {
                final brand = filteredBrands[index];
                return ListTile(
                  title: Text(brand.nome),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const MarcaSearch()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
