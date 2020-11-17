import 'package:flutter/foundation.dart';
import 'dart:collection';

class SingleInputData extends ChangeNotifier {
  List<SingleInputEntry> _singleInputEntries = [
    SingleInputEntry(
      value: 0.0,
      error: 0.5,
    ),
    SingleInputEntry(
      value: 1.0,
      error: 0.5,
    ),
    SingleInputEntry(
      value: 2.0,
      error: 0.5,
    ),
    SingleInputEntry(
      value: 3.0,
      error: 0.5,
    ),
    SingleInputEntry(
      value: 4.0,
      error: 0.5,
    ),
  ];

  UnmodifiableListView<SingleInputEntry> get singleInputEntries {
    return UnmodifiableListView(_singleInputEntries);
  }

  void addEntry(double value, double error) {
    _singleInputEntries.add(
      SingleInputEntry(
        value: value,
        error: error,
      ),
    );
    notifyListeners();
  }

  void removeEntry(int index) {
    _singleInputEntries.removeAt(index);

    notifyListeners();
  }

  void insertEntry(int index, SingleInputEntry element) {
    _singleInputEntries.insert(index, element);
    notifyListeners();
  }

  int getLength() {
    return _singleInputEntries.length;
  }

  double getSum() {
    double sum = 0;
    for (var item in _singleInputEntries) {
      sum += item.value;
    }
    return sum;
  }
}

class SingleInputEntry {
  final double value;
  final double error;

  SingleInputEntry({@required this.value, @required this.error});
}
