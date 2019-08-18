import 'package:flutter/material.dart';
import 'package:gemma/customWidget/SurveyRadioButton.dart';
import 'package:gemma/provider/SurveyButtonNumProvider.dart';
import 'package:provider/provider.dart';

class SurveyCard extends StatelessWidget {
  var _surveyCardNum = 0;
  var _question;
  List<SurveyRadioButton> _buttonList;

  SurveyCard(this._surveyCardNum, this._question, this._buttonList);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            _question,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ChangeNotifierProvider<SurveyButtonNumProvider>(
              builder: (context) => SurveyButtonNumProvider(0),
              child: Column(
                children: <Widget>[
                  for(var item in _buttonList) item
                ],
              )
              )
        ],
      ),
    ));
  }
}
