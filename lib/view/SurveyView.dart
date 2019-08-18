import 'package:flutter/material.dart';
import 'package:gemma/provider/SurveyResultNotifier.dart';
import 'package:gemma/route/RouteConfig.dart';
import 'package:gemma/model/SurveyRadioButtonModel.dart';
import 'package:gemma/customWidget/SurveyRadioButton.dart';
import 'package:provider/provider.dart';

class SurveyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<dynamic>.value(
        value: [0, 0, 0, 0],
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.purple,
          child: ListView(
            children: <Widget>[
              Text('체질 진단하기'),
              Text('질문을 읽고, 가장 가까운 선택지를 골라주세요!'),
              Text('(총 20개 문항)'),
              Card(
                  child: Column(
                children: <Widget>[],
              ))
            ],
          ),
        ));
  }
}
