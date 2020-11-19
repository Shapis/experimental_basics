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
    sd.round();

    for (var item in inputs) {
      sd += pow(item - singleAverage, 2);
    }
    return (sd / inputs.length);
  }

  double getSingleInputStandardDeviation() {
    return sqrt(getSingleInputVariance());
  }

  double getAverageError() {
    double avgError = 0;

    for (var item in errors) {
      avgError += item;
    }
    return avgError / errors.length;
  }

  int getAlgarismosSignificativos() {
    return 2;
  }
}
