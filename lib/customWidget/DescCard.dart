import 'package:flutter/material.dart';
import 'package:gemma/util/Settings.dart';

class DescCard extends StatelessWidget {
  Row _title;
  Text _contents;
  DescCard(title, contents) {
    this._title = title;
    this._contents = contents;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: gemmaElevation,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
            child: _title,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 0),
            child: _contents,
          ),
          Container(
              padding: EdgeInsets.only(right: 16),
              alignment: Alignment.centerRight,
              child: ButtonTheme(
                  minWidth: 90,
                  height: 25,
                  child: RaisedButton(
                    child: Text('더 보기'),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {},
                  )))
        ],
      ),
    );
  }
}
