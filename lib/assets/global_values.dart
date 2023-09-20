import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalValues {

  static ValueNotifier<bool> flagTheme = ValueNotifier<bool>(true);
  static final GlobalValues _instance = GlobalValues._internal();

  factory GlobalValues(){
    return _instance;
  }
  /*GlobalValues._internal();
  bool sessionCheck = false;*/
  GlobalValues._internal() {
    loadSessionCheck();
  }

  bool sessionCheck = false;

  Future<void> loadSessionCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sessionCheck = prefs.getBool('sessionCheck') ?? false;
  }

  Future<void> saveSessionCheck(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sessionCheck', newValue);
  }
  
}