import 'package:flutter/material.dart';
import 'package:gemma/model/ProfileModel.dart';
import 'package:gemma/util/DbProvider.dart';
import 'package:gemma/util/Theme.dart';
import 'package:gemma/view/MainView.dart';
import 'package:gemma/view/TutorialView.dart';
import 'package:provider/provider.dart';
import 'package:gemma/util/RouteConfig.dart' as router;

void main() async {
  Widget _defaultHome = TutorialView();
  DbProvider db = DbProvider.dbProviderInstance;

  // debug
  // await db.removeAllProfile();

  var count = await db.isProfileExsist();
  if(count > 0){
    ProfileModel _defaultProfile = await db.getDefaultProfile();
    print('get this profile:${_defaultProfile.toString()}');
    _defaultHome = MainView(defaultProfile:_defaultProfile);
  }
  runApp(GemmaApp(_defaultHome));
} 
 
class GemmaApp extends StatelessWidget {
  Widget _home;
  GemmaApp(this._home);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(builder:(_)=>ProfileModel()),
      ],
      child:MaterialApp(
      title: 'Gemma',
      theme: gemmaTheme,
      onGenerateRoute: router.generateRoute,
      home: _home,
    ));
  }
}
