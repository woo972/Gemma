import 'package:flutter/foundation.dart';

class ProfileModel with ChangeNotifier{
  int _id;
  String _name;
  int _sex;
  int _age;
  bool _defaultFlag;
  int _typeCode;  

  ProfileModel({id, name, sex, age, defaultFlag, typeCode}) : 
                _id = id, _name = name, _sex = sex,
                _age = age, _defaultFlag = defaultFlag,
                _typeCode = typeCode{
    this._defaultFlag = false;                   
    this._typeCode = 0;
  }

  ProfileModel.fromMap(Map<String, dynamic> inputMap){
    this._id = inputMap['id'];
    this._name = inputMap['name'];
    this._sex = inputMap['sex'];
    this._age = inputMap['age'];
    this._defaultFlag = (inputMap['default_flag']==1?true:false);
    this._typeCode = inputMap['type_code'];
  }

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'id' : this._id,
      'name' : this._name,
      'sex' : this._sex,
      'age' : this._age,
      'default_flag' : (this._defaultFlag?1:0),
      'type_code' : this._typeCode
    };
  }

  get id => this._id;
  get name => this._name;
  get sex => this._sex;
  get age => this._age;
  get defaultFlag => this._defaultFlag;
  get typeCode => this._typeCode;

  set id(id){
    this._id = id;
  }  
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
    notifyListeners();
  }  
  
  @override
  String toString() {
    return '[id]$_id [name]$_name [sex]$_sex [age]$_age [defaultFlag]$_defaultFlag [typeCode]$_typeCode';
  }
}
