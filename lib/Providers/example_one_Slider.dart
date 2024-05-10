import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ExampleOneSlider with ChangeNotifier {

  double _value = 1.0;

  double get value => _value;


  void setupValue(double val){
    _value = val;
    notifyListeners();
  }

}
