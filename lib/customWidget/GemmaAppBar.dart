import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GemmaAppBar{
  static getAppBar(){
    return AppBar(
      title: Text('달려라 한의'),
      leading: Builder(
          builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )),
    );
  }
}
