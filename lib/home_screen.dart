import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    log('Buttons');

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        answer.toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput = '';
                              answer = '';
                            });
                          },
                          title: "AC",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '+/-';
                            });
                          },
                          title: "+/-",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '%';
                            });
                          },
                          title: "%",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '/';
                            });
                          },
                          title: "/",
                          colors: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '7';
                            });
                          },
                          title: "7",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '8';
                            });
                          },
                          title: "8",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '9';
                            });
                          },
                          title: "9",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += 'x';
                            });
                          },
                          title: "x",
                          colors: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '4';
                            });
                          },
                          title: "4",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '5';
                            });
                          },
                          title: "5",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '6';
                            });
                          },
                          title: "6",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '-';
                            });
                          },
                          title: "-",
                          colors: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '1';
                            });
                          },
                          title: "1",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '2';
                            });
                          },
                          title: "2",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '3';
                            });
                          },
                          title: "3",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '+';
                            });
                          },
                          title: "+",
                          colors: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '0';
                            });
                          },
                          title: "0",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              userInput += '.';
                            });
                          },
                          title: ".",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              if (userInput == '') {
                                answer = '';
                              } else {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              }
                            });
                          },
                          title: "DEL",
                        ),
                        MyButtons(
                          onPress: () {
                            setState(() {
                              equalPress();
                            });
                          },
                          title: "=",
                          colors: Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;

    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
