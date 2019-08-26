import 'package:flutter/material.dart';
import 'package:gemma/model/SurveyRadioButtonModel.dart';
import 'package:gemma/provider/SurveyButtonNumProvider.dart';
import 'package:provider/provider.dart';

class SurveyRadioButton extends StatelessWidget {
  final SurveyRadioButtonModel _item;
  SurveyRadioButton(this._item);

  @override
  Widget build(BuildContext context) {
    final _buttonNum = Provider.of<SurveyButtonNumProvider>(context);
    
    return SizedBox(
        width: double.infinity,
        height: 40,
        child: RaisedButton(
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 10),
          color: _buttonNum.selectedButtonNum == _item.number
              ? Colors.greenAccent[400]
              : Colors.grey,
          child:
              Text(_item.text, style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: () {
            _buttonNum.selectedButtonNum = _item.number;
          },
        ));
  }
}
