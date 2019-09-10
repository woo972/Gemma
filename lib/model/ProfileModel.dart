class ProfileModel{
  var _id;
  var _name;
  var _sex;
  var _age;
  var _defaultFlag;
  // final birth_year;
  // final birth_month;
  // final birth_day;
  // final solar_flag;

  ProfileModel({id, name, sex, age, defaultFlag}) : 
                _id = id, _name = name, _sex = sex,
                _age = age, _defaultFlag = defaultFlag;

  get id => this._id;
  get name => this._name;
  get sex => this._sex;
  get age => this._age;
  get defaultFlag => this._defaultFlag;

  set id(id) => this._id = id;
  set name(name) => this._name = name;
  set sex(sex) => this._sex = sex;
  set age(age) => this._age = age;
  set defaultFlag(defaultFlag) => this._defaultFlag = defaultFlag;
}