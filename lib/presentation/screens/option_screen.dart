import 'package:flutter/material.dart';
import 'package:trivia_app/data/models/trivia_model.dart';
import 'package:trivia_app/presentation/widgets/option_button.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({
    super.key,
    required this.onOptionSelected,
  });
    final void Function(String) onOptionSelected;

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  int currentIndex = 0;
  bool isLoading = true;
  List<String> mergeAns = [];
  TriviaModel triviaModel=TriviaModel();


  void onTapSelected(String answer) {
    widget.onOptionSelected(answer);
    setState(() {
      currentIndex++;
      if (currentIndex == triviaModel.results!.length) {
        currentIndex = 0;
      }
      mergeAndShuffle();
    });
  }

  void mergeAndShuffle() {
    mergeAns = [
      triviaModel.results![currentIndex].correctAnswer!,
      ...triviaModel.results![currentIndex].incorrectAnswers!
    ];
    mergeAns.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.cyanAccent, Colors.greenAccent]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "${triviaModel.results![currentIndex].question}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 35),
            ...mergeAns.map(
              (option) => Option(
                optionParameter: option,
                onTapOption: () => onTapSelected(option),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
