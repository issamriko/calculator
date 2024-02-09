import 'package:calculator/widgets/mybutton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String calculation = "";
  String result = "";

  final List<String> buttons = [
    "C",
    "Del",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      calculation,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: 85,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  // rest button
                  return Mybutton(
                      buttonTapped: () {
                        setState(() {
                          calculation = "";
                        });
                      },
                      buttontext: "${buttons[index]}",
                      color: Colors.green,
                      textcolor: Colors.black);
                } else if (index == 1) {
                  // delete button
                  return Mybutton(
                      buttonTapped: () {
                        setState(
                          () {
                            print(calculation.length);
                            calculation = calculation.substring(
                                0, calculation.length - 1);
                          },
                        );
                      },
                      buttontext: "${buttons[index]}",
                      color: Colors.red,
                      textcolor: Colors.black);
                } else
                  return Mybutton(
                      // rest of the button
                      buttonTapped: () {
                        setState(() {
                          calculation += buttons[index];
                        });
                      },
                      buttontext: "${buttons[index]}",
                      color: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.white54,
                      textcolor: Colors.black);
              },
            ),
          ),
        ],
      ),
    );
  }
}

bool isOperator(String x) {
  if (x == "%" || x == "/" || x == "x" || x == "-" || x == "+" || x == "=") {
    return true;
  } else
    return false;
}
