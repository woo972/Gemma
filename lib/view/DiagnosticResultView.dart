import 'package:flutter/material.dart';
import 'package:gemma/gemmaContents/DiagnosticResults.dart';
import 'package:gemma/model/DiagnosticResultModel.dart';

class DiagnosticResultView extends StatelessWidget{
  int _typeCode;
  DiagnosticResultView(this._typeCode);

  @override
  Widget build(BuildContext context) {
    DiagnosticResultModel _diagnosticResultModel = 
      DiagnosticResults.getDiagnosticResults(_typeCode);

    return Scaffold(
      appBar: AppBar(
        title: Text('체질 진단 결과'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/main')),
          )
        ],
        leading: Container(),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Text('${_diagnosticResultModel.type}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.red
              )),
              SizedBox(
                height: 20,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('test'), 
                ),
              ),
              Text('체질의 특징',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),),
              Text('기질과 성격',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),),

          ],
        ),
      ),
    );
  }

}