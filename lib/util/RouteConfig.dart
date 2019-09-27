import 'package:flutter/material.dart';
import 'package:gemma/view/DiagnosticResultView.dart';
import 'package:gemma/view/SurveyView.dart';
import 'package:gemma/view/TutorialView.dart';
import 'package:gemma/view/MainView.dart';
import 'package:gemma/view/EditProfileView.dart';
import 'package:gemma/view/UnknownView.dart';


Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name){
    case '/main':
      return MaterialPageRoute(builder: (BuildContext context) => MainView(inputProfile: settings.arguments,)); 
    case'/tutorial': 
      return MaterialPageRoute(builder: (BuildContext context) => TutorialView()); 
    case'/diagnosis/survey': 
      return MaterialPageRoute(builder: (BuildContext context) => SurveyView()); 
    case'/diagnosis/result': 
      return MaterialPageRoute(builder: (BuildContext context) => DiagnosticResultView()); 
    case'/edit-profile': 
      return MaterialPageRoute(builder: (BuildContext context) => EditProfileView(inputProfile:settings.arguments)); 
    default: UnknownView(); break;
  }
}
