import 'package:flutter/material.dart';
import 'package:gemma/model/SurveyRadioButtonModel.dart';
import 'package:gemma/provider/SurveyButtonNumProvider.dart';
import 'package:provider/provider.dart';

class SurveyRadioButton extends StatelessWidget{
  final SurveyRadioButtonModel _item;
  SurveyRadioButton(this._item);

  @override
  Widget build(BuildContext context) {    
    final _buttonNum = Provider.of<SurveyButtonNumProvider>(context);
    var _surveyResponseCodeScore = Provider.of<dynamic>(context);
    

    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: _buttonNum == _item.getButtonNum() ?
             Colors.greenAccent[400] : Colors.grey,
      child: _item.getText(),      
      onPressed: (){        
        _buttonNum.setSelectedButtonNum(_item.getButtonNum());
      },
    );
  }
  
}