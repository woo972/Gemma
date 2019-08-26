import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gemma/route/RouteConfig.dart';

class EditProfileView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfileView> {

  var _nameCtrl = TextEditingController();
  var _dateCtrl = TextEditingController();
  var _sex = 'male';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameCtrl,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: '이름을 적어주세요.',
                    labelText: '이름'
                  ),
                  validator: (v){
                    return v.isEmpty? '이름을 입력해주세요' : null;                    
                  },
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      groupValue: 1,
                      value: 'male',
                      onChanged: (v) => _sex=v
                    ),
                    Radio(
                      groupValue: 1,
                      value: 'female',
                      onChanged: (v) => _sex=v
                    ),
                  ],
                ),
                GestureDetector(
                  child: TextFormField(
                    controller: _dateCtrl,
                    decoration: InputDecoration(
                      icon: Icon(Icons.date_range),
                      hintText: '생년월일을 선택해주세요.',
                      labelText: '생년월일'
                    ),
                    validator: (v){
                      return v.isEmpty? '생년월일을 입력해주세요' : null;                    
                    },                                   
                  ),
                  onTap: (){
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(1900, 1, 1),
                      maxTime: DateTime(2200, 12, 31),
                      locale: LocaleType.ko,
                      onConfirm: (date){
                        setState(() {
                          _dateCtrl.text = date.toString(); 
                        });
                      }
                    );
                  },
                )

              ],
            ),

          ),
          RaisedButton(
            child: Text('다음'),
            onPressed: (){
              Navigator.pushNamed(context, '/diagnosis/sheet');
            },
          )
        ],
      ),
    );
  }
}
