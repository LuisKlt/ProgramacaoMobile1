import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Imagem",
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Imagem"),
          backgroundColor: const Color.fromARGB(255, 134, 152, 255),
        ),
        body: Column(children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/2023_Facebook_icon.svg/2048px-2023_Facebook_icon.svg.png"),
          )
        ],),  
      )
    );
  }
}