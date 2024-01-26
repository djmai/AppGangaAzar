import 'package:flutter/material.dart';
import 'package:gangazar_app/bikers.dart';
import 'result_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ganga-azar',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCDB685),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BikersScreen()),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                '',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xFFb83132),
                ),
              ),
            ),
            const SizedBox(height: 600.0),
            ElevatedButton(
              onPressed: () async {
                String selectedBiker = getRandomBikerNameFromList();
                if (selectedBiker.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(selectedBiker),
                    ),
                  );
                } else {
                  print("No hay bikers en la lista.");
                }
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 255, 0, 0),
                onPrimary: const Color.fromARGB(255, 245, 245, 245),
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 30.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Quien gasta la gaseosa hoy',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
