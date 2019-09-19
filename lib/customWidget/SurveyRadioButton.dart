import 'package:flutter/material.dart';
import 'package:gemma/model/SurveyCardModel.dart';
import 'package:gemma/model/SurveyRadioButtonModel.dart';
import 'package:provider/provider.dart';

class SurveyRadioButton extends StatelessWidget {
  SurveyRadioButtonModel _surveyRadioButtonModel;

  SurveyRadioButton(this._surveyRadioButtonModel);

  get surveyRadioButtonModel => _surveyRadioButtonModel;

  @override
  Widget build(BuildContext context) {
    final _surveyCardModelProvider = Provider.of<SurveyCardModel>(context);
    return  SizedBox(
            width: double.infinity,
            height: 40,
            child: RaisedButton(              
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(vertical: 10),
              color: _surveyCardModelProvider.selectedButtonNum == _surveyRadioButtonModel.number
                  ? Colors.greenAccent[400]
                  : Colors.grey,
              child: Text(_surveyRadioButtonModel.text,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                _surveyCardModelProvider.selectedButtonNum = _surveyRadioButtonModel.number;                
                _surveyRadioButtonModel.setSurveyResponse(
                  _surveyCardModelProvider.surveyCardNum, _surveyCardModelProvider.selectedButtonNum);
              },
            ));
  }
}
