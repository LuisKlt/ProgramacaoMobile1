import 'package:api/api_service.dart';
import 'package:api/post.dart';
import 'package:flutter/material.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final ApiService apiService = ApiService();
  List<Post> posts = [];

  @override
  void initState() {
    _loadPosts();
    super.initState();
  }

  void _loadPosts() async {
    var aux = await apiService.getPosts();
    setState(() {
      posts = aux;
    });
  }

  void _createPost() async {
    Post novoPost = Post(
      userId: 22,
      id: 101,
      title: "Novo titulo",
      body: "informação de n sei oq n sei oq lá",
    );
    Post? aux = await apiService.createPost(novoPost);
    if (aux != null) {
      print('${aux.userId} - ${aux.id} - ${aux.title} - ${aux.body}');
    }
    _loadPosts();
  }

  void _updatePost() async {
    Post updatePost = Post(
      userId: 22,
      id: 101,
      title: "titulo atualizado",
      body: "informação atualizadissima",
    );
    Post? aux = await apiService.updatePost(updatePost, 22);
    if (aux != null) {
      print('${aux.userId} - ${aux.id} - ${aux.title} - ${aux.body}');
    }
    _loadPosts();
  }

  void _deletePost() async {
    await apiService.deletePost(1);
    _loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api exemplo'),
        backgroundColor: const Color.fromARGB(255, 114, 184, 180),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: ListTile(
              title: Text('${posts[index].userId} -${posts[index].id}'),
              subtitle: Text('${posts[index].title} -${posts[index].body}'),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _createPost,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _updatePost,
            child: const Icon(Icons.update),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _deletePost,
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
