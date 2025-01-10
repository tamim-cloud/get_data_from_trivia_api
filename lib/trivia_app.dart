import 'package:flutter/material.dart';
import 'package:trivia_app/presentation/screens/home_screen.dart';
import 'package:trivia_app/presentation/screens/option_screen.dart';
import 'package:trivia_app/presentation/screens/result_screen.dart';

class TriviaApp extends StatefulWidget {
  const TriviaApp({super.key});

  @override
  State<TriviaApp> createState() => _TriviaAppState();
}

class _TriviaAppState extends State<TriviaApp> {
  Widget? currentScreen;

  List<String> userAnswer = [];
  // TriviaModel triviaModel = TriviaModel();

  void switchScreen() {
    setState(() {
      currentScreen = OptionScreen(
        onOptionSelected: _addAnswer,
      );
    });
  }

  void restartQuizFunction() {
    userAnswer.clear();
    currentScreen = HomeScreen(onTap: switchScreen);
    setState(() {});
  }

  void _addAnswer(String answer) {
    userAnswer.add(answer);
    if (userAnswer.length == 15) {
      currentScreen =
          ResultScreen(answer: userAnswer, onTap: restartQuizFunction);
    }
  }

  @override
  void initState() {
    currentScreen = HomeScreen(
      onTap: switchScreen,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Trivia App"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.pink, Colors.purpleAccent]),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.greenAccent, Colors.cyanAccent]),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
