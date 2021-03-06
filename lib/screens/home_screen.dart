import 'dart:math';

import 'package:bmi_calculator_flutter/screens/score_screen.dart';
import 'package:bmi_calculator_flutter/widgets/age_weight_widget.dart';
import 'package:bmi_calculator_flutter/widgets/gender_widget.dart';
import 'package:bmi_calculator_flutter/widgets/height_widget.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(),
            child: Column(
              children: [
                GenderWiget(
                  onChange: (genderval) {
                    _gender = genderval;
                  },
                ),
                HeightWidget(onChange: (heightVal) {
                  _height = heightVal;
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWeightWidget(
                        onChange: (ageVal) {
                          _weight = ageVal;
                        },
                        title: "Age",
                        initValue: 30,
                        min: 0,
                        max: 100),
                    AgeWeightWidget(
                        onChange: (weightVal) {
                          _weight = weightVal;
                        },
                        title: "Weight(kg)",
                        initValue: 50,
                        min: 0,
                        max: 200),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: SwipeableButtonView(
                    isFinished: _isFinished,
                    onFinish: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          child: ScoreScreen(
                            bmiScore: _bmiScore,
                            age: _age,
                          ), type: PageTransitionType.fade
                        )
                      );
                      setState(() {
                        _isFinished = false;
                      });
                    },
                    activeColor: Colors.blue,
                    buttonText: 'CALCULATE',
                    buttonWidget: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                    onWaitingProcess: () {
                      calculateBmi();
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          _isFinished = true;
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
