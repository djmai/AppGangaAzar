import 'dart:math';
import 'package:flutter/material.dart';

class Biker {
  String name;

  Biker(this.name);
}

class BikersScreen extends StatefulWidget {
  @override
  _BikersScreenState createState() => _BikersScreenState();
}

class _BikersScreenState extends State<BikersScreen> {
  List<Biker> bikersList = [];
  final TextEditingController nameController = TextEditingController();

  String getRandomBikerNameFromList() {
    if (bikersList.isNotEmpty) {
      final random = Random();
      final randomIndex = random.nextInt(bikersList.length);
      return bikersList[randomIndex].name;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bikers',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFBC9B50),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFFFFFFF),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agregar Bikers:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF0000),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                labelStyle: TextStyle(color: const Color(0xFFFF0000)),
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 2),
            ElevatedButton(
              onPressed: () {
                addParticipant();
              },
              child: Text(
                'Agregar',
                style: TextStyle(color: const Color(0xFFFF0000)),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFF8F8F8),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Lista de Participantes:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: bikersList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFFFF0000),
                    elevation: 5.0,
                    child: ListTile(
                      title: Text(
                        bikersList[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addParticipant() {
    String name = nameController.text.trim();

    if (name.isNotEmpty) {
      Biker newBiker = Biker(name);

      setState(() {
        bikersList.add(newBiker);
      });

      // Limpiar los controladores después de agregar
      nameController.clear();
    }
  }
}
