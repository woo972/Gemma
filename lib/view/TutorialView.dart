import 'package:flutter/material.dart';
import 'package:gemma/view/MainView.dart';

class TutorialView extends StatelessWidget{
  static const _tutorialPages = <Text>[
    Text('test'),
    Text('2nd'),
    Text('third')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tutorialPages.length,
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            TabPageSelector(),
            Expanded(
              child: TabBarView(
                children: _tutorialPages,
              )
            ),
            RaisedButton(
              child:Text('건너뛰기'),
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
              }
            )
          ],)
        )
      )
    );
  }



}