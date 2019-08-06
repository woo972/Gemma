import 'package:flutter/material.dart';
import 'package:gemma/view/TutorialView.dart';

void main() => runApp(GemmaApp());

class GemmaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TutorialView(),
    );
  }
}
