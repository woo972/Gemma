import 'package:flutter/material.dart';

class SurveyResultProvider with ChangeNotifier{
  var _responseCodeArr;

  SurveyResultProvider(){
    this._responseCodeArr = [0,0,0,0];
  }

  get responseArr => _responseCodeArr;

  responseScoreIncrement(var code){
    _responseCodeArr[code]++;
  } 
  responseScoreDecrement(var code){
    _responseCodeArr[code]--;
  } 
  
  getResponseScore(var code) => _responseCodeArr[code];
}