import 'package:flutter/material.dart';

class SurveyRadioButtonModel with ChangeNotifier{
  Function _setSurveyResponse;
  int _number;
  String _text;
  
  SurveyRadioButtonModel.origin();
  SurveyRadioButtonModel(this._setSurveyResponse, this._number, this._text);

  get setSurveyResponse => _setSurveyResponse;
  get number => _number;
  get text => _text;
  set number(var number){
    this._number=number;
    notifyListeners();
  } 
  set text(text) => this._text = text;
}
