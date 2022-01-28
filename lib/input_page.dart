import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bmi_caculator.dart';
import 'circle_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum Gender {
  //dung kieu du lieu ENUM nay thay vi gan male = 1, female = 2 khi so sanh se de doc code hon
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 150;
  int weight = 50;
  int age = 20;
  Color maleCardColor = kInactiveReusableCardColor;
  Color femaleCardColor = kInactiveReusableCardColor;
  Gender
      status; //Gender nay da duoc tao tren ENUM dung de so sanh vs du lieu trong ENUM

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Alert(
                        context: context,
                        title: "RFLUTTER",
                        desc: "Flutter is awesome.")
                    .show();
              });
            },
            child: Icon(Icons.book)),
        elevation: 10,
        centerTitle: true,
        title: Text('MÁY TÍNH BMI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        status = Gender.male;
                      });
                    },
                    //Ternary Operation
                    colour: status == Gender.male //so sanh voi enum
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconContent(
                      genderSymbol: FontAwesomeIcons.mars,
                      label: 'NAM',
                      colour: status == Gender.female
                          ? kInactiveIconColor
                          : kActiveIconColor,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        status = Gender.female;
                      });
                    },
                    colour: status == Gender.female
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconContent(
                      genderSymbol: FontAwesomeIcons.venus,
                      label: 'NỮ',
                      colour: status == Gender.male
                          ? kInactiveIconColor
                          : kActiveIconColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('CHIỀU CAO', style: kLabelTextStyle),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(1),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    //paste cai nay qua Theme trong main.dart neu muon xai nhieu lan
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      thumbColor: Colors.white,
                      overlayColor: Color(0x29FFFFFF),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      min: 100.0,
                      max: 200.0,
                      value: height,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.roundToDouble();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('CÂN NẶNG', style: kLabelTextStyle),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleButton(
                              icon: FontAwesomeIcons.minus,
                              update: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            CircleButton(
                              icon: FontAwesomeIcons.plus,
                              update: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('TUỔI', style: kLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleButton(
                              icon: FontAwesomeIcons.minus,
                              update: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            CircleButton(
                              icon: FontAwesomeIcons.plus,
                              update: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMIcaculator calc = BMIcaculator(weight: weight, height: height);
              print(calc.calculate());
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ResultPage(
                  bmiCommentation: calc.getComment(),
                  bmiResult: calc.calculate(),
                  bmiText: calc.getResult(),
                  bmiTextColor: calc.getColorText(),
                );
              }));
            },
            child: Container(
              child: Center(
                child: Text(
                  'TÍNH CHỈ SỐ CỦA BẠN',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
