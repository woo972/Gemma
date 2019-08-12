import 'package:flutter/material.dart';
import 'package:gemma/view/DiagnosisView.dart';
import 'package:gemma/view/TutorialView.dart';
import 'package:gemma/view/MainView.dart';
import 'package:gemma/view/EditProfileView.dart';

final routes = {

  '/': (BuildContext context) => MainView(),
  'tutorial': (BuildContext context) => TutorialView(),
  'diagnosis': (BuildContext context) => DiagnosisView(),
  'edit-profile': (BuildContext context) => EditProfileView(),
};