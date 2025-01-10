import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.optionParameter,
    required this.onTapOption,
  });

  final String optionParameter;
  final void Function() onTapOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: onTapOption,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Text(
          optionParameter,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
