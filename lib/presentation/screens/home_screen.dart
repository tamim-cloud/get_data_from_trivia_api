import 'package:flutter/material.dart';
import 'package:trivia_app/presentation/screens/data_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Let's Check Data From Trivia API",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent),
          ),
          SizedBox(height: 35),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DataScreen()),
              );
            },
            label: Text("Get Data"),
            icon: Icon(Icons.api),
          ),
          SizedBox(height: 25),
          OutlinedButton.icon(
            onPressed: onTap,
            label: Text("Start Quiz From Trivia API"),
            icon: Icon(Icons.quiz),
          ),
        ],
      ),
    );
  }
}
