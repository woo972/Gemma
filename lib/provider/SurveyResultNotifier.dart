import 'package:flutter/material.dart';

class SurveyResultProvider with ChangeNotifier{
  var _responseCodeArr;

  SurveyResultProvider(){
    this._responseCodeArr = [0,0,0,0];
  }

  getResponseArr() => _responseCodeArr;
  getResponseScore(var code) => _responseCodeArr[code];

  setResponseScoreIncrement(var code){
    _responseCodeArr[code]++;
    notifyListeners();
  } 
  setResponseScoreDecrement(var code){
    _responseCodeArr[code]--;
    notifyListeners();
  } 
}