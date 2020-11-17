class SingleInputMath {
  double addAll(List<double> myDoubles) {
    double sum = 0;
    for (var item in myDoubles) {
      sum += item;
    }
    return sum;
  }
}
