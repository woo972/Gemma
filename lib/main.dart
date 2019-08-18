import 'package:flutter/material.dart';
import 'package:gemma/route/RouteConfig.dart';

void main() => runApp(GemmaApp());

class GemmaApp extends StatelessWidget {

  // check user state and load settings

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
      routes: routes,
    );
  }
}
