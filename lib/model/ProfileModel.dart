import 'package:flutter/foundation.dart';

class ProfileModel{
  final id;
  final name;
  final sex;
  final birth_year;
  final birth_month;
  final birth_day;
  final solar_flag;
  final age;
  final default_flag;

  ProfileModel({this.id, @required this.name, this.sex,
                this.birth_year, this.birth_month, this.birth_day,
                this.solar_flag, this.age, this.default_flag});
}