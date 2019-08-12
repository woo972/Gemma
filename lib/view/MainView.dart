import 'package:flutter/material.dart';
import 'package:gemma/route/RouteConfig.dart';

class MainView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16
        ),
        
        child:Column(
        children: <Widget>[
          Text('내 체질 정보'),
          Card(
            child: FlatButton(
              child: ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('내 체질 진단하기'),
                trailing: Icon(Icons.arrow_forward_ios),
                contentPadding: EdgeInsets.all(0),              
              ),
              onPressed: (){
                Navigator.pushNamed(context, 'diagnosis');
              },
            )
            
          ),
          Text('사상체질 알아보기'),
          ListView(
            children: <Widget>[
              DescCard(),
              DescCard(),
              DescCard(),
              DescCard()
            ],
          )
        ],
      ),
    ));
  }
}



class DescCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
              children: <Widget>[
                Text('태양인'),
                Icon(Icons.wb_sunny)
              ],
            ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child:           
            Text('블라블라 동해물과 백두산이 마르고 닳도록'+
            '하느님이 보우하사 우리나라만세'+
            '무궁화 삼천리 화려강산 대한사람 대한으로'+
            '길이 보전하세 태양인은 전체의 약 블라블라 퍼센트'),
            ),
            ButtonTheme(
              minWidth: 90,
              height: 25,              
              child: RaisedButton(              
                child: Text('더 보기'),                              
                color: Colors.white,                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                onPressed: (){},
              )
            )

          ],),);
  }
  
}