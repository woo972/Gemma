import 'package:flutter/material.dart';

class ListPopUpContent extends StatefulWidget{

  final Widget content;

  const ListPopUpContent({Key key, this.content}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListPopUpContentState();
  }
}

class ListPopUpContentState extends State<ListPopUpContent>{
  @override
  void initState(){
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.content,
    );
  }
}