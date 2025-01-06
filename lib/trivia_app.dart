import 'package:flutter/material.dart';
import 'package:trivia_app/presentation/screens/home_screen.dart';

class TriviaApp extends StatelessWidget {
  const TriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Trivia App"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.pink, Colors.purpleAccent])),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.greenAccent, Colors.cyanAccent])),
            child: HomeScreen()),
      ),
    );
  }
}
