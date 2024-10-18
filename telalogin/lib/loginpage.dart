import 'package:flutter/material.dart';
import 'package:telalogin/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String user = '';
  String senha = '';
  bool showSenha = false;
  double opacidade = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 243, 255),
        body: Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 120,
                ),
                const Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Steam_icon_logo.svg/1200px-Steam_icon_logo.svg.png"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  onChanged: (text) {
                    user = text;
                  },
                  autofocus: true,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome de Usuário",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (text) {
                    senha = text;
                  },
                  autofocus: true,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.black),
                    suffixIcon: GestureDetector(
                        child: Icon(
                          showSenha == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            showSenha = !showSenha;
                          });
                        }),
                  ),
                  obscureText: showSenha == false ? true : false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Opacity(
                  opacity: opacidade,
                  child: const Text(
                    "Usuário ou senha inválidos.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 168, 36, 26),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonTheme(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    if (senha == 'bike70') {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => HomePage(user: user)),
                      );
                    } else {
                      setState(() => opacidade = 1.0);
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                )),
              ],
            ))));
  }
}
