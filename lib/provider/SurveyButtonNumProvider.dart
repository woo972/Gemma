import 'package:flutter/material.dart';

class SurveyButtonNumProvider with ChangeNotifier{
  var _buttonNum;

  SurveyButtonNumProvider(this._buttonNum);

  getSelectedButtonNum() => this._buttonNum;
  
  setSelectedButtonNum(var buttonNum){
    _buttonNum=buttonNum;
    notifyListeners();
  } 
}