import 'package:flutter/material.dart';
import 'package:gemma/route/RouteConfig.dart';

class EditProfileView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(

          ),
          TextField(

          ),
          Checkbox(
            value: true, 
            onChanged: (bool value) {value = true;},
          )
        ],
      ),
    );
  }
}
