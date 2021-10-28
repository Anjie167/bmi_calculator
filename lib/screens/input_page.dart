import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/constants.dart';
import '../components/bottom_button.dart';
import 'calculator_brain.dart';

enum GenderType {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  void increaseWeightNumber(){
    setState(() {
      weight++;
    });
  }
  void decreaseWeightNumber(){
    setState(() {
      weight--;
    });
  }

  void increaseAgeNumber(){
    setState(() {
      age++;
    });
  }
  void decreaseAgeNumber(){
    setState(() {
      age--;
    });
  }




  GenderType  selectedGender;
  int height = 120;
  int weight = 74;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = GenderType.male;
                    });
                  },
                  cardChild: IconContent(gender: 'MALE', genderIcon: FontAwesomeIcons.mars,),
                  colour: selectedGender == GenderType.male ? kActiveCardColour: kInactiveCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  },
                  cardChild: IconContent(gender: 'FEMALE',
                  genderIcon: FontAwesomeIcons.venus,),
                  colour: selectedGender == GenderType.female ? kActiveCardColour : kInactiveCardColour,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HEIGHT',
              style: kLabelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(),
                  style: kNumberTextStyle,
                  ),
                  Text('CM',
                  style: kLabelTextStyle,)
                ]
                ,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                ),
                child: Slider(value: height.toDouble(),
                    onChanged: (double newValue){
                  setState(() {
                    height = newValue.toInt();
                  });
                    },
                  min: 120.0,
                  max: 220.0,
              ),)
            ],
          ),
            colour: kActiveCardColour,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: kLabelTextStyle,),
                      Text(weight.toString(), style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPress: (){
                              increaseWeightNumber();
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                          SizedBox(width: 10.0,),
                        RoundIconButton(
                          onPress: (){
                            decreaseWeightNumber();
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        ],
                      ),

                    ],
                  ),
                  colour: kActiveCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: kLabelTextStyle,),
                      Text(age.toString(), style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPress: (){
                              increaseAgeNumber();
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                            onPress: (){
                              decreaseAgeNumber();
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                        ],
                      ),
                    ],
                  ),
                  colour: kActiveCardColour,
                ),
              ),
            ],
          ),
        ),
        BottomButton(text: 'CALCULATE',
        onTap: (){
          CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            );
          },),);
        },),
      ]),
    );
  }
}



