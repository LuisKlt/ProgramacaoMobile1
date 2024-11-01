import 'package:flutter/material.dart';

class ApiTela extends StatefulWidget {
  const ApiTela({super.key});

  @override
  State<ApiTela> createState() => _ApiTelaState();
}

class _ApiTelaState extends State<ApiTela> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Tela da Api'),
      )
    );
  }
}