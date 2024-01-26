import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String selectedBiker;

  const ResultScreen(this.selectedBiker, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Center(
        child: Text(
          'El elegido es:\n$selectedBiker',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
