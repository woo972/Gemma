import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemma/customWidget/GemmaAppBar.dart';
import 'package:gemma/customWidget/GemmaDrawer.dart';
import 'package:gemma/model/ProfileModel.dart';
import 'package:gemma/util/DbProvider.dart';
import 'package:gemma/util/RouteConfig.dart';

class EditProfileView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditProfileState();
}

// https://github.com/DK15/quiz-app-flutter/blob/master/lib/main.dart
class EditProfileState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  var _nameCtrl = TextEditingController();
  var _ageCtrl = TextEditingController();

  var _name;
  var _age;
  var _sex = 1;
  var _default_flag = false;

  void _setSex(value) {
    setState(() {
      _sex = value;
    });
  }

  void _setDefaultFlag(value) {
    setState(() {
      _default_flag = value;
    });
  }

  String _validateName(v) {
    v = v.trim();
    if (v.isEmpty) {
      return '이름을 입력해주세요';
    } else if (v.length <= 0 || v.length >= 20) {
      return '1자리 이상 10자리 미만으로 입력해주세요';
    } else {
      return null;
    }
  }

  String _validateAge(v) {
    String pattern = r'^[0-9]+$';
    RegExp regExp = RegExp(pattern);
    if (v.isEmpty) {
      return '나이를 입력해주세요';
    } else if (!regExp.hasMatch(v)) {
      return '숫자만 입력해주세요';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GemmaAppBar.getAppBar(),
        drawer: GemmaDrawer(),
        body: Container(
          color: Colors.purple,
          padding: EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: _nameCtrl,
                    validator: _validateName,
                    onSaved: (v) => {_name = v},
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: '이름을 적어주세요.',
                        labelText: '이름'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    controller: _ageCtrl,
                    validator: _validateAge,
                    onSaved: (v) => {_age = v},
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: '나이를 적어주세요.',
                        labelText: '나이'),
                  ),
                  Row(
                    children: <Widget>[
                      Text('남자'),
                      Radio(
                          groupValue: _sex,
                          value: 1, //male
                          onChanged: _setSex),
                      Text('여자'),
                      Radio(
                          groupValue: _sex,
                          value: 2, //female
                          onChanged: _setSex),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('기본 프로필로 설정하기'),
                      Checkbox(
                        value: _default_flag,
                        onChanged: _setDefaultFlag,
                      )
                    ],
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('저장'),              
              onPressed: () {
                if(_formKey.currentState.validate()){
                  DbProvider db = DbProvider.dbProviderInstance;
                  ProfileModel p = ProfileModel(name: _name, age: _age, sex: _sex,
                                                default_flag: _default_flag);
                  db.saveProfile(p).then((v) {
                    print(v);
                  });
                  Navigator.pushReplacementNamed(context, '/main');
                }
              }
            )
          ]),
        ));
  }
}
