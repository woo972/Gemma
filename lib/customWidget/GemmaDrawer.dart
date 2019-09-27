import 'package:flutter/material.dart';
import 'package:gemma/customWidget/ListPopUp.dart';
import 'package:gemma/customWidget/ListPopUpContent.dart';
import 'package:gemma/model/ProfileModel.dart';
import 'package:gemma/util/DbProvider.dart';

class GemmaDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GemmaDrawerState();
  }
}
class GemmaDrawerState extends State<GemmaDrawer>{
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
              _db.getProfileList().then((rslt) {
                profileList = rslt;
                Navigator.push(
                    context,
                    ListPopUp(
                      top: 30,
                      left: 60,
                      right: 60,
                      bottom: 50,
                      child: ListPopUpContent(
                          content: Scaffold(
                        appBar: AppBar(
                          title: Text('프로필 관리'),
                          actions: <Widget>[
                            IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () => Navigator.pop(context))
                          ],
                          leading: Container(),
                        ),
                        body: ListView.builder(
                            itemCount: profileList.length,
                            itemBuilder: (BuildContext context, int idx) {
                              return ListTile(
                                key: UniqueKey(),
                                leading: profileList[idx].defaultFlag == 1
                                    ? Icon(Icons.check_circle)
                                    : Icon(Icons.remove_circle_outline),
                                title: Text(profileList[idx].name),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/edit-profile', arguments: profileList[idx]);        
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        if(profileList[idx].defaultFlag==1){
                                          showDialog(
                                            context: context,
                                            child: SimpleDialog(
                                              title: Text('알림'),
                                              children: <Widget>[
                                                Text('기본 프로필은 삭제할 수 없습니다. 해당 프로필을 삭제하려면 다른 프로필을 기본 프로필로 변경 후 삭제하세요.')
                                              ],
                                            )
                                          );
                                        }else{
                                          _db.removeProfileById(profileList[idx].id);
                                        }
                                      },
                                    )
                                  ],
                                ),
                              );
                            }),
                        floatingActionButton: FloatingActionButton(
                            child: Icon(Icons.add),
                            mini: true,
                            onPressed: () =>
                                Navigator.pushNamed(context, '/edit-profile')),
                      )),
                    ));
              });
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
