import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier{
  var _name;
  var _age;
  var _sex;
  var _defaultFlag;

  get name => _name;
  get age => _age;
  get sex => _sex;
  get defaultFlag => _defaultFlag;

  set name(name){
    this._name = name;
    notifyListeners();
  }  
  set age(age){
    this._age = age;
    notifyListeners();
  }  
  set sex(sex){
    this._sex = sex;
    notifyListeners();
  }  
  set defaultFlag(defaultFlag){
    this._defaultFlag = defaultFlag;
    notifyListeners();
  }  

  // void setSex(sex) => this._sex= sex;

}
