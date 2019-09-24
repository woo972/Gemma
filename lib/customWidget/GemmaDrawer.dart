import 'package:flutter/material.dart';
import 'package:gemma/model/ProfileModel.dart';
import 'package:gemma/util/DbProvider.dart';

class GemmaDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            children: <Widget>[
              Text(
                '달려라 한의',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(),
              ListTile(
                title: Text('프로필관리'),
                trailing: Icon(Icons.person),
                onTap: () {
                  DbProvider _db = DbProvider.dbProviderInstance;
                  List<ProfileModel> profileList;
                  _db.getProfileList().then((rslt){
                    profileList=rslt;
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          content: Container(
                            child: ListView.builder(
                              itemCount: profileList.length,
                              itemBuilder: (BuildContext context, int idx){
                                return ListTile(
                                  title: profileList[idx].name
                                );
                              }
                            ),
                          ),
                        );
                      }
                    );
                  });
                  // Navigator.pushNamed(context,'/edit-profile');
                },
              ),
              Divider(),
              ListTile(
                title: Text('체질정보관리'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('공지사항'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('알림 설정'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('건강정보 수신동의'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: Text('앱 버전'),
                trailing: Text('v0.0.1'),
              ),
              Divider(),
            ],
          ),
        );
  }

}