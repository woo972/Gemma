import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gemma/gemmaContents/DiagnosticResults.dart';
import 'package:gemma/model/DiagnosticResultModel.dart';
import 'package:gemma/model/ProfileModel.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DiagnosticResultView extends StatelessWidget{
  ProfileModel _defaultProfile;

  WebViewController _wbCtrl;

  @override
  Widget build(BuildContext context) {
    _defaultProfile = Provider.of<ProfileModel>(context);
    String url;
    switch(_defaultProfile.typeCode){
      case 1: url = 'https://woo972.github.io/GemmaWeb/bp-kor.html'; break;
      default: url = 'https://woo972.github.io/GemmaWeb/bp-kor.html'; break;
     }
    // DiagnosticResultModel _diagnosticResultModel = 
    //   DiagnosticResults.getDiagnosticResults(_defaultProfile.typeCode);

    return Scaffold(
      appBar: AppBar(
        title: Text('체질 진단 결과'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            // popUntil 사용시 bad state 에러...
            // onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/main'))
            onPressed: () => Navigator.pushNamed(context, '/main')
          )
        ],
        leading: Container(),
      ),
      body: Container(
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.disabled,
          onWebViewCreated: (WebViewController wbCtrl){
            this._wbCtrl = wbCtrl;
          },
          gestureRecognizers: Set()..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
        )



        // child: ListView(
        //   children: <Widget>[
        //     Text('${_diagnosticResultModel.type}',
        //       style: TextStyle(
        //         fontSize: 15,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.red
        //       )),
        //       SizedBox(
        //         height: 20,
        //         child: Padding(
        //           padding: EdgeInsets.all(16),
        //           child: Text('test'), 
        //         ),
        //       ),
        //       Text('체질의 특징',
        //         style: TextStyle(
        //           fontSize: 13,
        //           fontWeight: FontWeight.bold
        //         ),),
        //       Text('기질과 성격',
        //         style: TextStyle(
        //           fontSize: 13,
        //           fontWeight: FontWeight.bold
        //         ),),

        //   ],
        // ),
      ),
    );
  }

}