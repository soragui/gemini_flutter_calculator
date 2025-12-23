import 'package:flutter/material.dart';
import 'package:calculator/logic/calculator_logic.dart';
import 'package:calculator/ui/widgets/calculator_app_bar.dart';
import 'package:calculator/ui/widgets/calculator_button.dart';
import 'package:calculator/ui/widgets/calculator_display.dart';
import 'package:calculator/utils/constants.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic _logic = CalculatorLogic();

  void _onButtonPressed(String buttonText) {
    setState(() {
      _logic.buttonPressed(buttonText);
    });
  }

  void _onUndo() {
    setState(() {
      _logic.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalculatorAppBar(onUndo: _onUndo),
      body: Column(
        children: <Widget>[
          CalculatorDisplay(
            expression: _logic.expression,
            result: _logic.result,
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                final buttonText = buttons[index];
                if (buttonText.isEmpty) {
                  return const SizedBox.shrink();
                }
                Color? color;
                Color? textColor;
                if (buttonText == '=') {
                  color = equalColor;
                  textColor = equalTextColor;
                } else if (['C', '(', ')', 'mod', 'π', '√', 'x²']
                    .contains(buttonText)) {
                  textColor = specialColor;
                } else if (['÷', '×', '-', '+', '%'].contains(buttonText)) {
                  textColor = operatorColor;
                }

                return CalculatorButton(
                  text: buttonText,
                  color: color,
                  textColor: textColor,
                  onPressed: () => _onButtonPressed(buttonText),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
