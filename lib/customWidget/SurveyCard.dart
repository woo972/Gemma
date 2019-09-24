import 'package:flutter/material.dart';
import 'package:gemma/model/SurveyCardModel.dart';
import 'package:gemma/util/Settings.dart';
import 'package:provider/provider.dart';

class SurveyCard extends StatelessWidget {
  final SurveyCardModel _surveyCardModel;

  SurveyCard(this._surveyCardModel);

  get surveyCardModel => _surveyCardModel;

  @override
  Widget build(BuildContext context) {
    return Card(      
      elevation: gemmaElevation,
        child: Container(
      padding: EdgeInsets.all(16),      
      child: Column(children: <Widget>[
        Text(
          _surveyCardModel.question,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ChangeNotifierProvider<SurveyCardModel>(
            builder: (context) => SurveyCardModel.origin(_surveyCardModel),
            child: Column(
              children: <Widget>[
                ..._surveyCardModel.buttonList.map((button) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: button,
                    ))
              ],
            ))
      ]),
    ));
  }
}
