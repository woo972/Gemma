class SurveyRadioButtonModel{
  var _isSelected;
  var _number;
  var _text;
  
  SurveyRadioButtonModel(this._isSelected, this._number, this._text);

  get isSelected => _isSelected;
  get number => _number;
  get text => _text;

  set isSelected(isSelected) => this._isSelected = isSelected;
  set number(number) => this._number = number;
  set text(text) => this._text = text;
}
