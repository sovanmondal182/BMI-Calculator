// ignore_for_file: sort_child_properties_last, unnecessary_brace_in_string_interps

import 'package:bmi/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'icon_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculate.dart';

Color normalBorder = Colors.white;
Color activeBorder = const Color(0xFF4F7DF9);
Color normalColor = const Color(0xFFFDFDFD);
Color activeColor = const Color(0xFFFAFAFA);
int valueft = 0;
int valuein = 0;
int valuekg = 0;
int valueage = 0;
int valuecm = 0;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;

  @override
  Widget build(BuildContext context) {
    var boxShadow2 = [
      const BoxShadow(
        blurRadius: 5.0,
        color: Colors.black12,
        offset: Offset(-1, 5),
      ),
    ];
    double valuecm = (valueft * 30.48) + (valuein * 2.54);

    var column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(
          child: Divider(
            color: Color(0xFFB3C7F9),
            thickness: 2,
            height: 1,
          ),
        ),
        SizedBox(
          child: Divider(
            color: Color(0xFFB3C7F9),
            thickness: 2,
            height: 1,
          ),
        ),
      ],
    );
    var column2 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(
          child: Divider(
            color: Color(0xFF4F7DF9),
            thickness: 2,
            height: 1,
          ),
        ),
        SizedBox(
          child: Divider(
            color: Color(0xFF4F7DF9),
            thickness: 2,
            height: 1,
          ),
        ),
      ],
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              color: Color(0xFF4D5760),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    child: Container(
                      child: const IconCard(
                        icon: FontAwesomeIcons.person,
                        text: "Male",
                      ),
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        boxShadow: boxShadow2,
                        border: Border.all(
                          color: gender == Gender.male
                              ? activeBorder
                              : normalBorder,
                          width: 3,
                        ),
                        color:
                            gender == Gender.male ? activeColor : normalColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: Container(
                      child: const IconCard(
                        icon: FontAwesomeIcons.personDress,
                        text: "Female",
                      ),
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        boxShadow: boxShadow2,
                        border: Border.all(
                          color: gender == Gender.female
                              ? activeBorder
                              : normalBorder,
                          width: 3,
                        ),
                        color:
                            gender == Gender.female ? activeColor : normalColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: const Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D4852),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 160,
                        decoration: BoxDecoration(
                          boxShadow: boxShadow2,
                          color: const Color(0xFFF8FAFF),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 50,
                              child: CupertinoPicker(
                                selectionOverlay: column,
                                squeeze: 1,
                                looping: true,
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    valueft = index;
                                  });
                                },
                                diameterRatio: 1,
                                useMagnifier: true,
                                magnification: 1.2,
                                itemExtent: 25,
                                children: List<Widget>.generate(
                                  11,
                                  (index) => Text(
                                    '$index',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3D4852),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 15,
                              child: CupertinoPicker(
                                selectionOverlay: column,
                                diameterRatio: 1,
                                useMagnifier: true,
                                magnification: 1.2,
                                itemExtent: 25,
                                onSelectedItemChanged: (int value) {},
                                children: List<Widget>.generate(
                                  1,
                                  (index) => const Text(
                                    'ft',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF3D4852),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        decoration: BoxDecoration(
                          boxShadow: boxShadow2,
                          color: const Color(0xFFF8FAFF),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 50,
                              child: CupertinoPicker(
                                selectionOverlay: column,
                                squeeze: 1,
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    valuein = index;
                                  });
                                },
                                looping: true,
                                diameterRatio: 1,
                                itemExtent: 25,
                                useMagnifier: true,
                                magnification: 1.2,
                                children: List<Widget>.generate(
                                  12,
                                  (index) => Text(
                                    '$index',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3D4852),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 15,
                              child: CupertinoPicker(
                                selectionOverlay: column,
                                diameterRatio: 1,
                                itemExtent: 25,
                                useMagnifier: true,
                                magnification: 1.2,
                                onSelectedItemChanged: (int value) {},
                                children: List<Widget>.generate(
                                  1,
                                  (index) => const Text(
                                    'in',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3D4852),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "${valueft} feet ${valuein} inches (${valuecm.round()} cm)",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                boxShadow: boxShadow2,
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight (kg)",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3D4852),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 80,
                          child: CupertinoPicker(
                            useMagnifier: true,
                            magnification: 1.2,
                            selectionOverlay: column2,
                            squeeze: 1,
                            looping: true,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                valuekg = index;
                              });
                            },
                            diameterRatio: 1,
                            itemExtent: 40,
                            children: List<Widget>.generate(
                              201,
                              (index) => Text(
                                '$index',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3D4852),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      boxShadow: boxShadow2,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Age",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3D4852),
                            )),
                        SizedBox(
                          height: 120,
                          width: 80,
                          child: CupertinoPicker(
                            selectionOverlay: column2,
                            squeeze: 1,
                            useMagnifier: true,
                            magnification: 1.2,
                            looping: true,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                valueage = index;
                              });
                            },
                            diameterRatio: 1,
                            itemExtent: 40,
                            children: List<Widget>.generate(
                              101,
                              (index) => Text(
                                '$index',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3D4852),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      boxShadow: boxShadow2,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: boxShadow2,
            ),
            margin: const EdgeInsets.all(15),
            height: 50.0,
            width: double.infinity,
            child: ElevatedButton(
              child: const Text("Calculate BMI",
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
              onPressed: () {
                Calculate cal =
                    Calculate(height: valuecm.toInt(), weight: valuekg);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return resultPage(
                    bmi: cal.calculateBMI(),
                    text: cal.calculateText(),
                    result: cal.calculateResult(),
                  );
                }));
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF4F7DF9)),
                padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
