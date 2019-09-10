import 'package:flutter/material.dart';
import 'package:gemma/util/RouteConfig.dart';

class DiagnosticResultView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('체질 진단 결과'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Text('태양인',
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