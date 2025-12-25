import 'package:flutter/material.dart';

const List<String> buttons = [
  'C', '(', ')', 'mod', 'π',
  '7', '8', '9', '÷', '√',
  '4', '5', '6', '×', 'x²',
  '1', '2', '3', '-', '', // Empty string for the last row to be 5x5
  '0', '.', '%', '+', '=', // = will take two spots
];

const Color primaryColor = Colors.white;
const Color operatorColor = Colors.green;
const Color specialColor = Colors.blueGrey;
const Color equalColor = Colors.orange;
const Color textColor = Colors.black;
const Color equalTextColor = Colors.white;
