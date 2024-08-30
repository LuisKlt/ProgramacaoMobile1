import 'package:flutter/material.dart';

void main() {
  runApp(const Sextou());
}

class Sextou extends StatelessWidget {
  const Sextou({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Balada Seguras',
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'PokerApp',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
            backgroundColor: Color.fromARGB(255, 37, 136, 123),
            foregroundColor: Colors.white,
          ),
          body: Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.fromLTRB(5, 30, 20, 10),
          padding: EdgeInsets.all(10),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bet'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Amount: '),
                  Text('1000 '),
                  Text('2000 ')
                ],
              ),
              Text('Raise'),
              Text('Fold'),
            ],
          ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null, backgroundColor: Color.fromARGB(255, 37, 136, 123),),
        ));
  }
}
