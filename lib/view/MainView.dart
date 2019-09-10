import 'package:flutter/material.dart';
import 'package:gemma/customWidget/DescCard.dart';
import 'package:gemma/customWidget/GemmaAppBar.dart';
import 'package:gemma/customWidget/GemmaDrawer.dart';
import 'package:gemma/util/DbProvider.dart';
import 'package:gemma/util/RouteConfig.dart';

class MainView extends StatelessWidget {
  DbProvider db = DbProvider.dbProviderInstance;

  @override
  Widget build(BuildContext context) {
    // future builder 사용해서 프로필 긁어올것
    return Scaffold(
        backgroundColor: Colors.blue,
        drawer: GemmaDrawer(),
        appBar: GemmaAppBar.getAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: Column(
            children: <Widget>[
              Card(
                child: FlatButton(
                child: ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text('내 체질 진단하기'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  contentPadding: EdgeInsets.all(0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/diagnosis/survey');
                },
              )),
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '사상체질 알아보기',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  /* ListView 상단 padding 기본 적용
                     https://github.com/flutter/flutter/issues/14842                      
                  */
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView(
                        children: <Widget>[
                          DescCard(
                            Row(
                              children: <Widget>[
                                Text(
                                  '태양인',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red[400],
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Icon(Icons.wb_sunny))
                              ],
                            ),
                            Text('블라블라 동해물과 백두산이 마르고 닳도록' +
                                '하느님이 보우하사 우리나라만세' +
                                '무궁화 삼천리 화려강산 대한사람 대한으로' +
                                '길이 보전하세 태양인은 전체의 약 블라블라 퍼센트'),
                          ),
                          DescCard(
                            Row(
                              children: <Widget>[
                                Text(
                                  '태음인',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.purple[400],
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Icon(Icons.cloud))
                              ],
                            ),
                            Text('블라블라 동해물과 백두산이 마르고 닳도록' +
                                '하느님이 보우하사 우리나라만세' +
                                '무궁화 삼천리 화려강산 대한사람 대한으로' +
                                '길이 보전하세 태양인은 전체의 약 블라블라 퍼센트'),
                          ),
                          DescCard(
                            Row(
                              children: <Widget>[
                                Text(
                                  '소양인',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.brown[400],
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Icon(Icons.graphic_eq))
                              ],
                            ),
                            Text('블라블라 동해물과 백두산이 마르고 닳도록' +
                                '하느님이 보우하사 우리나라만세' +
                                '무궁화 삼천리 화려강산 대한사람 대한으로' +
                                '길이 보전하세 태양인은 전체의 약 블라블라 퍼센트'),
                          ),
                          DescCard(
                            Row(
                              children: <Widget>[
                                Text(
                                  '소음인',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue[400],
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Icon(Icons.local_florist))
                              ],
                            ),
                            Text('블라블라 동해물과 백두산이 마르고 닳도록' +
                                '하느님이 보우하사 우리나라만세' +
                                '무궁화 삼천리 화려강산 대한사람 대한으로' +
                                '길이 보전하세 태양인은 전체의 약 블라블라 퍼센트'),
                          ),
                        ],
                      )))
            ],
          ),
        ));
  }
}
