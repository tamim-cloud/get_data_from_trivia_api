import 'package:flutter/material.dart';
import 'package:trivia_app/presentation/screens/data_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Lets Check Data From Trivia API",
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
        ],
      ),
    );
  }
}
