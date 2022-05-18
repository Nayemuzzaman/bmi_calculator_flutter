import 'package:bmi_calculator_flutter/widgets/age_weight_widget.dart';
import 'package:bmi_calculator_flutter/widgets/gender_widget.dart';
import 'package:bmi_calculator_flutter/widgets/height_widget.dart';
import 'package:flutter/material.dart';

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
                      max: 100
                     ),
                    AgeWeightWidget(
                      onChange: (weightVal) {
                        _weight = weightVal;
                      },
                      title: "Weight(kg)",
                      initValue: 50,
                      min: 0,
                      max: 200
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
