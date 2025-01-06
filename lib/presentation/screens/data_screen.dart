import 'package:flutter/material.dart';
import 'package:trivia_app/data/database/trivia_db.dart';
import 'package:trivia_app/data/models/trivia_model.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  ConvertJsonToTriviaModel convertJsonToTriviaModel =
      ConvertJsonToTriviaModel();
  bool isLoading = true;
  late TriviaModel triviaModel;

  @override
  void initState() {
    loadPost();
    super.initState();
  }

  Future loadPost() async {
    try {
      triviaModel = await convertJsonToTriviaModel.jsonToTrivia();
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data From Trivia API"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : triviaModel.results!.isEmpty
              ? Center(
                  child: Text("No Data Found"),
                )
              : ListView.builder(
                  itemCount: triviaModel.results!.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: Text("${index + 1}"),
                      ),
                      title: Text("${triviaModel.results![index].question}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Type: ${triviaModel.results![index].type}"),
                          Text(
                              "Difficulty: ${triviaModel.results![index].difficulty}"),
                          Text(
                              " Catagory: ${triviaModel.results![index].category}"),
                          Text(
                              "Wrong Answer: ${triviaModel.results![index].incorrectAnswers}"),
                          Text(
                              "Correct answer: ${triviaModel.results![index].correctAnswer}"),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
