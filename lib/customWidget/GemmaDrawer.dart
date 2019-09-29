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

class GemmaDrawerState extends State<GemmaDrawer> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  DbProvider _db = DbProvider.dbProviderInstance;

  Widget _buildRow(ProfileModel profile, int idx, Animation animation) {
    return SizeTransition(
        sizeFactor: animation,
        child: ListTile(
          key: ValueKey(profile.id),
          leading: profile.defaultFlag
              ? Icon(Icons.check_circle)
              : Icon(Icons.remove_circle_outline),
          title: Text(profile.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-profile',
                      arguments: profile);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  if (profile.defaultFlag) {
                    showDialog(
                        context: context,
                        child: SimpleDialog(
                          title: Text('알림'),
                          children: <Widget>[
                            Text(
                                '기본 프로필은 삭제할 수 없습니다. 다른 프로필을 기본 프로필로 변경 후 삭제하세요.')
                          ],
                        ));
                  } else {
                    AnimatedListRemovedItemBuilder builder = (context, animation) {
                      return _buildRow(profile, idx, animation);
                    };
                    _db.removeProfileById(profile.id).then(
                        (v) => _listKey.currentState.removeItem(idx, builder));
                  }
                },
              )
            ],
          ),
        ));
  }

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
                // 나중에 따로 View로 뺄것
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
                        body: AnimatedList(
                            key: _listKey,
                            initialItemCount: profileList.length,
                            itemBuilder: (context, idx, animation) {
                              return _buildRow(profileList[idx], idx, animation);
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
          ListTile(
            title: Text('오픈소스 라이브러리'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
