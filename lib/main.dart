import 'package:flutter/material.dart';
import 'package:gemma/util/DbProvider.dart';
import 'package:gemma/util/RouteConfig.dart';
import 'package:gemma/view/MainView.dart';
import 'package:gemma/view/TutorialView.dart';

void main() {
  Widget _defaultHome = TutorialView();
  DbProvider db = DbProvider.dbProviderInstance;
  db.isProfileExsist().then((count){
    print(count);
    if(count > 0){
      _defaultHome = MainView();
    }
  });
  runApp(GemmaApp(_defaultHome));
} 
 
class GemmaApp extends StatelessWidget {
  Widget _home;
  GemmaApp(this._home);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.grey[900],
          displayColor: Colors.white
        )
      ),
      home: _home,
      routes: routes,
    );
  }
}
