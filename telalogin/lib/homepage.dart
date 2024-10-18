import 'package:flutter/material.dart';
import 'package:telalogin/loginpage.dart';

class HomePage extends StatefulWidget {
  final String user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String user;

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 243, 255),
        body: Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bem vindo $user!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonTheme(
                      child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      "Voltar",
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  )),
                ],
              ),
            )));
  }
}
