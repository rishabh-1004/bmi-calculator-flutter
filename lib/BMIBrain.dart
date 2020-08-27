import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;

  double _bmi;

  CalculateBMI({this.height, this.weight});

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    getBMI();
    if (_bmi >= 25) {
      return "OverWeight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "underweight";
    }
  }

  String getComment() {
    if (_bmi >= 25) {
      return "You are OverWeight... ha ha ha haaa haa haa";
    } else if (_bmi > 18.5) {
      return "Normal..!! Sounds Good";
    } else {
      return "underweight, Comon Skimpy";
    }
  }
}
