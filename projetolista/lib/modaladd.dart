import 'package:flutter/material.dart';

class Modaladd extends StatefulWidget {
  const Modaladd({super.key});

  @override
  State<Modaladd> createState() => _ModaladdState();
}

class _ModaladdState extends State<Modaladd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text("Cadastrar usuário",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "Nome do usuário")
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "Sobrenome do usuário")
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "CPF do usuário")
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "Idade do usuário")
              ),
              Expanded(child: Container()),
              ButtonTheme(child: ElevatedButton(
                onPressed: (){}, 
                style: const ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size.fromHeight(60)),
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                ),
                child: Text("Cadastrar",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              )
            )
          ],
        )
      )
    )
  );
}}