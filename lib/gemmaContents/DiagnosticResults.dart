import 'package:gemma/model/DiagnosticResultModel.dart';

class DiagnosticResults{
  static getDiagnosticResults(int typeCode){
    switch(typeCode){
      case 1:
        return DiagnosticResultModel(
          '태양인','http://',
          '화를 잘내고 블라블라 얄라리얄라성 얄라리얄라',
          '높은 언덕 굽이굽이 구름을 누르고 흐르는 물 잔잔히 돌밑에 감도누나'); 
    }
  }
}

