import 'package:flutter/material.dart';
import 'package:gemma/customWidget/SurveyRadioButton.dart';

class SurveyCardModel with ChangeNotifier{
  int _surveyCardNum;  
  String _question;
  List<SurveyRadioButton> _buttonList;
  int _selectedButtonNum=0;

  SurveyCardModel.origin(SurveyCardModel surveyCardModel)
    :_surveyCardNum = surveyCardModel.surveyCardNum;

  SurveyCardModel(this._surveyCardNum, this._question, this._buttonList);

  get surveyCardNum => _surveyCardNum;
  get question => _question;
  get buttonList => _buttonList;
  get selectedButtonNum => _selectedButtonNum;

  set selectedButtonNum(selectedButtonNum){ 
    this._selectedButtonNum = selectedButtonNum;
    notifyListeners();
  }
}