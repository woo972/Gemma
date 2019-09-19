import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemma/model/ProfileModel.dart';
import 'package:gemma/util/DbProvider.dart';
import 'package:provider/provider.dart';

// https://github.com/DK15/quiz-app-flutter/blob/master/lib/main.dart
class EditProfileView extends StatelessWidget {
  final DbProvider db = DbProvider.dbProviderInstance;

  // provider의 영향으로 리빌드되어 static으로 해야하는 것 같음
  static final _formKey = GlobalKey<FormState>();
  static final _nameCtrl = TextEditingController();
  static final _ageCtrl = TextEditingController();

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
    ProfileModel _profileProvider = Provider.of<ProfileModel>(context);
    return Scaffold(
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
                onSaved: (v) => _profileProvider.name = v,
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
                onSaved: (v) => _profileProvider.age = v,
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: '나이를 적어주세요.',
                    labelText: '나이'),
              ),
              Row(
                children: <Widget>[
                  Text('남자'),
                  Radio(
                      groupValue: _profileProvider.sex,
                      value: 1, //male
                      onChanged: (v) => _profileProvider.sex = v),
                  Text('여자'),
                  Radio(
                      groupValue: _profileProvider.sex,
                      value: 2, //female
                      onChanged: (v) => _profileProvider.sex = v),
                ],
              ),
            ],
          ),
        ),
        RaisedButton(
            child: Text('저장'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                ProfileModel p = ProfileModel(
                    name: _profileProvider.name,
                    age: _profileProvider.age,
                    sex: _profileProvider.sex,
                    defaultFlag: 0);
                db.saveProfile(p).then((v) {
                  print(v);
                });
                // main으로 데이터 넘길것
                Navigator.pushReplacementNamed(context, '/main');
              }
            })
      ]),
    ));
  }
}
