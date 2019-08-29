import 'package:flutter/material.dart';
import 'package:gemma/customWidget/GemmaAppBar.dart';
import 'package:gemma/customWidget/GemmaDrawer.dart';
import 'package:gemma/gemmaContents/DiagnosticQuestions.dart';

class SurveyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        drawer: GemmaDrawer(),
        appBar: GemmaAppBar.getAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: ListView(
            children: <Widget>[
              Text('체질 진단하기'),
              Text('질문을 읽고, 가장 가까운 선택지를 골라주세요!'),
              Text('(총 20개 문항)'),
              ...DiagnosticQuestions.getDiagnosticQuestions()
                  .map((survyeCard) => Container(
                        child: survyeCard,
                      ))
            ],
          ),
        ));
  }
}
