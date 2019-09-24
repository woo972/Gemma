import 'package:gemma/model/DiagnosticResultModel.dart';

class DiagnosticResults{
  static getDiagnosticResults(int typeCode){
    switch(typeCode){
      case 1:
        return DiagnosticResultModel(
          '태양인','http://',
          '화를 잘내고 블라블라 얄라리얄라성 얄라리얄라',
          '높은 언덕 굽이굽이 구름을 누르고 흐르는 물 잔잔히 돌밑에 감도누나'); 
      case 2:
        return DiagnosticResultModel(
          '태음인','http://',
          '블리자드 배틀넷 디아블로3 구매 할인 19,800원',
          '높은 언덕 굽이굽이 구름을 누르고 흐르는 물 잔잔히 돌밑에 감도누나'); 
      case 3:
        return DiagnosticResultModel(
          '소양인','http://',
          '나눔바른고딕 스퀘어 라운드가 아니무니다',
          '높은 언덕 굽이굽이 구름을 누르고 흐르는 물 잔잔히 돌밑에 감도누나'); 
      case 4:
        return DiagnosticResultModel(
          '소음인','http://',
          '시끄러운 생활',
          '높은 언덕 굽이굽이 구름을 누르고 흐르는 물 잔잔히 돌밑에 감도누나'); 
    }
  }
}

