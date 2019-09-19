import 'package:flutter/material.dart';
import 'package:gemma/customWidget/GemmaAppBar.dart';
import 'package:gemma/customWidget/GemmaDrawer.dart';
import 'package:gemma/gemmaContents/DiagnosticQuestions.dart';
import 'package:gemma/util/DbProvider.dart';
import 'package:gemma/view/DiagnosticResultView.dart';

class SurveyView extends StatelessWidget {
  Map<int, int> responseMap = Map<int, int>();
  int typeCode=0;

  void setSurveyResponse(int surveyCardNum, int selectedButtonNum) {
    responseMap[surveyCardNum] = selectedButtonNum;
  }
  void countSurveyResponse(VoidCallback moveToResultPage){
    Map<int, int> responseCountMap = Map<int, int>();
    responseMap.values.forEach((selectedButtonNum){
      responseCountMap.putIfAbsent(selectedButtonNum, () => 0);
      responseCountMap[selectedButtonNum]++;
    });
    // 동률일때는 어떻게 할것인가?
    List<int> sortedKeyList = responseCountMap
                              .keys.toList(growable: false)
                              ..sort((a, b) 
                                => responseCountMap[b]-responseCountMap[a]);
    typeCode = sortedKeyList[0];

    saveResult();
    return moveToResultPage();
  }
  void saveResult(){
    DbProvider _db = DbProvider.dbProviderInstance;
    // _db.saveDiagnosticResult(ProfileModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        drawer: GemmaDrawer(),
        appBar: GemmaAppBar.getAppBar(),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  Text('체질 진단하기'),
                  Text('질문을 읽고, 가장 가까운 선택지를 골라주세요!'),
                  Text('(총 20개 문항)'),
                  ...DiagnosticQuestions.getDiagnosticQuestions(setSurveyResponse)
                      .map((survyeCard) => Container(
                            child: survyeCard,
                          )),
                  RaisedButton(
                      child: Text('결과보기'),
                      onPressed: (){
                        countSurveyResponse(
                          ()=>Navigator.push(context, 
                                MaterialPageRoute(builder:(context) =>
                                  DiagnosticResultView(typeCode))));          
                      })
                ],
              ),
            )));
  }
}
