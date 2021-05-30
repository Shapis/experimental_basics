import 'package:flutter/material.dart';
import 'dart:math';

class StandardDeviationMath {
  final List<double> inputs;
  final List<double> errors;

  StandardDeviationMath({@required this.inputs, @required this.errors});

  String getAverage() {
    double temp = 0;
    for (var item in inputs) {
      temp += item;
    }
    return (temp / inputs.length).toStringAsPrecision(getPrecisionDegree());
  }

  double getSingleInputVariance() {
    double singleAverage = double.tryParse(getAverage());
    double sd = 0;
    //sd.round(); // Not sure why I added this line initially.

    for (var item in inputs) {
      sd += pow(item - singleAverage, 2);
    }
    return (sd / inputs.length);
  }

  String getSingleInputStandardDeviation() {
    return sqrt(getSingleInputVariance())
        .toStringAsPrecision(getPrecisionDegree());
  }

  double getAverageError() {
    double errorSum = 0;

    for (var item in errors) {
      errorSum += item;
    }

    // Returns a double with 1 significant figure.
    return double.tryParse((errorSum / errors.length).toStringAsPrecision(1));
  }

  int getPrecisionDegree() {
    int significantFigures;
    for (var item in errors) {
      int temp = 0;
      bool firstSignificantFigureReached = false;
      for (var i = 0; i < item.toString().length; i++) {
        if (item.toString()[i] != '0' && item.toString()[i] != '.') {
          firstSignificantFigureReached = true;
        }
        if (firstSignificantFigureReached && item.toString()[i] != '.') {
          temp++;
        }
      }
      if (significantFigures == null) {
        significantFigures = temp;
      } else if (significantFigures > temp) {
        significantFigures = temp;
      }
    }
    return significantFigures ?? 1;
  }
}
