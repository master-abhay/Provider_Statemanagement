import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ThemeChanger with ChangeNotifier{

  //After Creating this class don't forget to add this in main MultiProvider:
var _themeMode = ThemeMode.light;

ThemeMode get themeMode => _themeMode;

 void changeTheme(theme){
  _themeMode = theme;
  notifyListeners();
}

}
