class SurveyRadioButtonModel{
  var _buttonNum = 999;
  var _text;
  
  SurveyRadioButtonModel(isSelected, buttonNum, text){
    this._buttonNum = buttonNum;
    this._text = text;
  }
  getButtonNum(){
    return _buttonNum;
  }
  getText(){
    return _text;
  }
}
