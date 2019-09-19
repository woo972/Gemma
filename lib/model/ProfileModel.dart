import 'package:flutter/foundation.dart';

class ProfileModel with ChangeNotifier{
  var _id;
  var _name;
  var _sex;
  var _age;
  var _defaultFlag;
  var _typeCode;  

  ProfileModel({id, name, sex, age, defaultFlag, typeCode}) : 
                _id = id, _name = name, _sex = sex,
                _age = age, _defaultFlag = defaultFlag,
                _typeCode = typeCode;

  get id => this._id;
  get name => this._name;
  get sex => this._sex;
  get age => this._age;
  get defaultFlag => this._defaultFlag;
  get typeCode => this._typeCode;

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
  set typeCode(typeCode){
    this._typeCode = typeCode;
  }  
}