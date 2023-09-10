import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget{
  final int age;
  final bool isMale;
  final double bmi;

  ResultPage({
    required this.age,
    required this.isMale,
    required this.bmi
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Gender: ${isMale ? 'Male' : 'Female'}',
              style: TextStyle(
                fontSize: 36.0
              ),
            ),
            Text(
              'Age: ${age}',
              style: TextStyle(
                  fontSize: 36.0
              ),
            ),
            Text(
              'BMI: ${bmi}',
              style: TextStyle(
                  fontSize: 36.0
              ),
            ),
          ],
        ),
      )
    );
  }

}