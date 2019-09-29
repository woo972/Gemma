import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemma/model/ProfileModel.dart';
import 'package:gemma/util/DbProvider.dart';
import 'package:gemma/util/Settings.dart';

// https://github.com/DK15/quiz-app-flutter/blob/master/lib/main.dart
class EditProfileView extends StatefulWidget {
  ProfileModel _innerProfile = ProfileModel();
  final ProfileModel _inputProfile;

  EditProfileView({inputProfile}) : this._inputProfile = inputProfile {
    if (inputProfile != null) {
      _innerProfile.id = inputProfile.id;
      _innerProfile.name = inputProfile.name;
      _innerProfile.age = inputProfile.age;
      _innerProfile.sex = inputProfile.sex;
      _innerProfile.defaultFlag = inputProfile.defaultFlag;
    } else {
      _innerProfile.name = '';
      _innerProfile.sex = 1;
      _innerProfile.defaultFlag = false;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return EditProfileViewState();
  }
}

class EditProfileViewState extends State<EditProfileView> {
  final DbProvider _db = DbProvider.dbProviderInstance;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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

  void _navigation() {
    if (widget._innerProfile.defaultFlag) {
      Navigator.pushReplacementNamed(context, '/main', arguments: widget._innerProfile);
    } else {
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // textFormFile 사용 위해서는 MaterialWidget 조상이 필요함
        key: _scaffoldKey,
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    initialValue: widget._innerProfile.name,
                    validator: _validateName,
                    onSaved: (v) {
                      widget._innerProfile.name = v;
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: '이름을 적어주세요.',
                        labelText: '이름'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    initialValue: widget._innerProfile.age == null
                        ? ''
                        : widget._innerProfile.age.toString(),
                    validator: _validateAge,
                    onSaved: (v) {
                      widget._innerProfile.age = int.parse(v);
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: '나이를 적어주세요.',
                        labelText: '나이'),
                  ),
                  Row(
                    children: <Widget>[
                      Text('남자'),
                      Radio(
                          groupValue: widget._innerProfile.sex,
                          value: 1, //male
                          onChanged: (v) {
                            setState(() {
                              widget._innerProfile.sex = v;
                            });
                          }),
                      Text('여자'),
                      Radio(
                          groupValue: widget._innerProfile.sex,
                          value: 2, //female
                          onChanged: (v) {
                            setState(() {
                              widget._innerProfile.sex = v;
                            });
                          }),
                    ],
                  ),
                  Checkbox(
                      value: widget._innerProfile.defaultFlag,
                      onChanged: (v) {
                        setState(() {
                          widget._innerProfile.defaultFlag = v;
                        });
                      })
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                    elevation: gemmaElevation,
                    child: Text('저장'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save(); // onSaved 실행
                        if (widget._innerProfile.id != null) {
                          if (widget._innerProfile.defaultFlag) {
                            _db.initializeDefaultFlag().then((v) {
                              _db.updateProfile(widget._innerProfile).then((v) {
                                _navigation();
                              });
                            });
                          } else {
                            _db.updateProfile(widget._innerProfile).then((v) {
                              _navigation();
                            });
                          }
                        } else {
                          if (widget._innerProfile.defaultFlag) {
                            _db.initializeDefaultFlag().then((v) {
                              _db.saveProfile(widget._innerProfile).then((v) {
                                _navigation();
                              });
                            });
                          } else {
                            _db.saveProfile(widget._innerProfile).then((v) {
                              _navigation();
                            });
                          }
                        }
                      }
                    }))
          ]),
        ));
  }
}
