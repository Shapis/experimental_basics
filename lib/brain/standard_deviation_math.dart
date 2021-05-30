import 'package:flutter/material.dart';
import 'dart:math';

class StandardDeviationMath {
  final List<double> inputs;
  final List<double> errors;

  StandardDeviationMath({@required this.inputs, @required this.errors});

  double getAverage() {
    double temp = 0;
    for (var item in inputs) {
      temp += item;
    }
    return temp / inputs.length;
  }

  double getSingleInputVariance() {
    double singleAverage = getAverage();
    double sd = 0;
    //sd.round(); // Not sure why I added this line initially.

    for (var item in inputs) {
      sd += pow(item - singleAverage, 2);
    }
    return (sd / inputs.length);
  }

  double getSingleInputStandardDeviation() {
    return sqrt(getSingleInputVariance());
  }

  double getAverageError() {
    double errorSum = 0;

    for (var item in errors) {
      errorSum += item;
    }

    // Returns a double with 1 significant figure.
    return double.tryParse((errorSum / errors.length).toStringAsPrecision(1));
  }

  int getAlgarismosSignificativos() {
    //print(algarismosSignificativos);
    return 2;
  }
}
