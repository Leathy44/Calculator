import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  final String title;
  const Calculator({required this.title, Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color color) {
    return ElevatedButton(
        onPressed: buttonPressed(buttonText),
        // ignore: sort_child_properties_last
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(350, 200),
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width * 0.195,
            height: MediaQuery.of(context).size.height * 0.16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2.5,
                  blurRadius: 3,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Text("$mounted"),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      buildButton("x", Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      buildButton("%", Colors.orangeAccent),
                      const SizedBox(
                        width: 10,
                      ),
                      buildButton("/", Colors.orangeAccent),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      buildButton("7", Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      buildButton("8", Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      buildButton("9", Colors.grey),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      buildButton("4", Colors.grey ),
                      const SizedBox(
                        width: 10,
                      ),
                      buildButton("5", Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      buildButton("6", Colors.grey),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      buildButton("1", Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      buildButton("2",Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      buildButton("3", Colors.grey),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      buildButton("C", Colors.deepOrange),
                      const SizedBox( 
                        width: 10,
                      ),
                      buildButton("0", Colors.grey),
                      const SizedBox(
                        width: 10,
                      ),
                      buildButton(".", Colors.grey),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  buildButton("*", Colors.blue),
                  const SizedBox(
                    height: 10,
                  ),
                  buildButton("-", Colors.blue),
                  const SizedBox(
                    height: 10,
                  ),
                  buildButton("+", Colors.blue),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 40,
                    height: 110,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("="),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }}