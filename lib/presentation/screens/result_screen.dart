import 'package:flutter/material.dart';
import 'package:trivia_app/data/models/trivia_model.dart';

class ResultScreen extends StatelessWidget {
  final List<String> answer;
  final void Function() onTap;

  const ResultScreen({
    super.key,
    required this.answer,
    required this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    TriviaModel triviaModel=TriviaModel();
      List<Map<String, Object>> resultSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < answer.length; i++) {
      summary.add({
        'index': i,
        'question': triviaModel.results![i].question.toString(),
        'correct_ans': triviaModel.results![i].correctAnswer.toString(),
        'user_ans': answer[i],
      });
    }
    return summary;
  }
    final summaryData = resultSummary();
    int score = summaryData.where((question) => question['correct_ans'] == question['user_ans']).length;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyanAccent, Colors.purpleAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have correctly answered $score out of ${triviaModel.results!.length}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: summaryData.length,
                itemBuilder: (ctx, index) {
                  final item = summaryData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: item['correct_ans'] == item['user_ans'] ? Colors.green : Colors.red,
                          child: Text('${item['index']}', style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Q: ${item['question']}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text("Your answer: ${item['user_ans']}", style: TextStyle(color: Colors.orange)),
                              Text("Correct Answer: ${item['correct_ans']}", style: TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: onTap,
              child: Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
