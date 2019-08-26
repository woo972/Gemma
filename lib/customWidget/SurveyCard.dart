import 'package:flutter/material.dart';
import 'package:gemma/customWidget/SurveyRadioButton.dart';
import 'package:gemma/provider/SurveyButtonNumProvider.dart';
import 'package:provider/provider.dart';

class SurveyCard extends StatelessWidget {
  final _surveyCardNum;
  final _question;
  var _button1;
  var _button2;
  var _button3;
  var _button4;

  SurveyCard(this._surveyCardNum, this._question, this._button1, this._button2,
      this._button3, this._button4);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            _question, 
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ChangeNotifierProvider<SurveyButtonNumProvider>(
              builder: (context) => SurveyButtonNumProvider(0),
              child: Column(
                children: <Widget>[
                  _button1,
                  SizedBox(height: 10,),
                  _button2,
                  SizedBox(height: 10,),
                  _button3, 
                  SizedBox(height: 10,),
                  _button4
                ],
              ))
        ],
      ),
    ));
  }
}
