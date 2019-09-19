import 'package:flutter/material.dart';
import 'package:gemma/view/DiagnosticResultView.dart';
import 'package:gemma/view/SurveyView.dart';
import 'package:gemma/view/TutorialView.dart';
import 'package:gemma/view/MainView.dart';
import 'package:gemma/view/EditProfileView.dart';

final routes = {

  '/main': (BuildContext context) => MainView(null),
  '/tutorial': (BuildContext context) => TutorialView(),
  '/diagnosis/survey': (BuildContext context) => SurveyView(),
  '/diagnosis/result': (BuildContext context) => DiagnosticResultView(0),
  '/edit-profile': (BuildContext context) => EditProfileView(),
}; 