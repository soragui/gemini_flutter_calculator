import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String _expression = '';
  String _result = '';

  String get expression => _expression;
  String get result => _result;

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _expression = '';
      _result = '';
    } else if (buttonText == '=') {
      try {
        var p = GrammarParser();
        Expression exp = p.parse(
          _expression
              .replaceAll('×', '*')
              .replaceAll('÷', '/')
              .replaceAll('π', '3.1415926535897932')
              .replaceAll('√', 'sqrt')
              .replaceAll('x²', '^2')
              .replaceAll('mod', '%'),
        );
        ContextModel cm = ContextModel();
        _result = exp.evaluate(EvaluationType.REAL, cm).toString();
      } catch (e) {
        _result = 'Error';
      }
    } else {
      _expression += buttonText;
    }
  }

  void undo() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
  }
}
