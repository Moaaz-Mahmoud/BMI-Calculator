import 'dart:math';

import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}


class _HomePageState extends State<HomePage>{
  static const backgroundColor = Color.fromRGBO(1, 2, 13, 1.0);
  static const sectionBorderRadius = 10.0;

  static const sectionMargin = EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0
  );
  static const Color sectionDefaultColor = Color.fromRGBO(2, 20, 34, 1.0);
  static const Color sectionToggledColor = Color.fromRGBO(50, 133, 201, 1.0);

  static const upIconSize = 60.0;
  static const upIconColor = Colors.white60;

  static const smallTextStyle = TextStyle(
    color: Colors.white60,
    fontSize: 14.0
  );
  static const largeTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 28.0,
    fontWeight: FontWeight.bold
  );

  Color section1Color = sectionDefaultColor;
  Color section2Color = sectionDefaultColor;
  double height = 177;
  double weight = 60;
  int age = 28;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            // Up ==============================================================
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                        child: GestureDetector(
                          child: Container(
                            margin: sectionMargin,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: SizedBox()),
                                Expanded(
                                  child: Icon(
                                    Icons.male,
                                    size: upIconSize,
                                    color: upIconColor,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Expanded(
                                  child: Text(
                                    'MALE',
                                    style: smallTextStyle,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: section1Color,
                              borderRadius: BorderRadius.circular(sectionBorderRadius),
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              section1Color = sectionToggledColor;
                              section2Color = sectionDefaultColor;
                              isMale = true;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(),
                        child: GestureDetector(
                          child: Container(
                            margin: sectionMargin,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: SizedBox()),
                                Expanded(
                                  child: Icon(
                                    Icons.female,
                                    size: upIconSize,
                                    color: upIconColor,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Expanded(
                                  child: Text(
                                    'FEMALE',
                                    style: smallTextStyle,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: section2Color,
                              borderRadius: BorderRadius.circular(sectionBorderRadius),
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              section1Color = sectionDefaultColor;
                              section2Color = sectionToggledColor;
                              isMale = false;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Mid =============================================================
            Expanded(
              flex: 3,
              child: Container(
                margin: sectionMargin,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Column(
                    children: [
                      Text(
                        'HEIGHT',
                        style: smallTextStyle
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: largeTextStyle
                          ),
                          Text(
                            ' cm',
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 16.0
                            ),
                          )
                        ],
                      ),
                      Slider(
                        value: height,
                        max: 230.0,
                        min: 80.0,
                        onChanged: (value){
                          setState(() {
                            height = value;
                          });
                        }
                      )
                    ],
                  )
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sectionBorderRadius),
                  color: sectionDefaultColor,
                ),
              ),
            ),
            // Down ============================================================
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: smallTextStyle,
                            ),
                            Text(
                              '${weight.round()}',
                              style: largeTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  child: Icon(Icons.remove),
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                      weight = max(weight, 10);
                                    });
                                  }
                                ),
                                FloatingActionButton(
                                    mini: true,
                                    child: Icon(Icons.add),
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                        weight = min(weight, 350);
                                      });
                                    }
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sectionBorderRadius),
                          color: sectionDefaultColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: smallTextStyle,
                            ),
                            Text(
                              '$age',
                              style: largeTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    mini: true,
                                    child: Icon(Icons.remove),
                                    onPressed: (){
                                      setState(() {
                                        age = max(1, age-1);
                                      });
                                    }
                                ),
                                FloatingActionButton(
                                    mini: true,
                                    child: Icon(Icons.add),
                                    onPressed: (){
                                      setState(() {
                                        age = min(120, age+1);
                                      });
                                    }
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(sectionBorderRadius),
                          color: sectionDefaultColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Calc ============================================================
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: MaterialButton(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.redAccent,
                  onPressed: (){
                    var bmi = weight / pow(height.round()/100.0, 2);
                    bmi = double.parse(bmi.toStringAsFixed(2));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          age: age,
                          isMale: isMale,
                          bmi: bmi
                        )
                      )
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
