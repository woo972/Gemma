import 'package:flutter/material.dart';

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
                  Navigator.pushNamed(context,'/edit-profile');
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