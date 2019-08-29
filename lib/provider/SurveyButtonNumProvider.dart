import 'package:flutter/material.dart';

class SurveyButtonNumProvider with ChangeNotifier{
  var _buttonNum;

  SurveyButtonNumProvider(this._buttonNum);

  get selectedButtonNum => this._buttonNum;
  
  set selectedButtonNum(var buttonNum){
    this._buttonNum=buttonNum;
    notifyListeners();
  } 
}