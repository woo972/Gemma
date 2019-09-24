import 'package:flutter/material.dart';
import 'package:gemma/model/ProfileModel.dart';
import 'package:gemma/util/DbProvider.dart';

class GemmaDrawer extends StatelessWidget {
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // https://api.flutter.dev/flutter/material/AlertDialog-class.html
                      return SimpleDialog(
                        title: Text('프로필 목록'),
                        children: <Widget>[
                          SimpleDialogOption(
                            child: Text('option'),
                            onPressed: (){},
                          ),
                        Container(
                          /* [Error] RenderViewport does not support returning intrinsic dimensions 
                               위 에러 workaround로 해결하기 위해 width 부여 */
                          width: 200,
                          height: 400,
                          child: ListView.builder(
                              itemCount: profileList.length,
                              itemBuilder: (BuildContext context, int idx) {
                                return ListTile(
                                    leading: profileList[idx].defaultFlag==1? Icon(Icons.check_circle) : Icon(Icons.remove_circle_outline),
                                    title: Text(profileList[idx].name),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: (){},
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: (){},
                                        )
                                      ],
                                    ),
                                    );
                              }),
                        ),
                      ]);
                    });
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
