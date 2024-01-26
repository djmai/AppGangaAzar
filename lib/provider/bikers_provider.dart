import 'dart:math';

import 'package:flutter/foundation.dart';

import '../bikers.dart';

class BikerListProvider with ChangeNotifier {
  List<Biker> _bikersList = [];

  List<Biker> get bikersList => _bikersList;

  String getRandomBikerNameFromList() {
    if (_bikersList.isNotEmpty) {
      final random = Random();
      final randomIndex = random.nextInt(_bikersList.length);
      return _bikersList[randomIndex].name;
    } else {
      return '';
    }
  }
}
