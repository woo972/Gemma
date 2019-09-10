import 'package:gemma/customWidget/SurveyCard.dart';
import 'package:gemma/customWidget/SurveyRadioButton.dart';
import 'package:gemma/model/SurveyRadioButtonModel.dart';

class DiagnosticQuestions{  
  static List<SurveyCard> getDiagnosticQuestions(){
    List<SurveyCard> cardList = List()
    ..add(SurveyCard(
      1,
      '나의 골격은?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '허리가 굵은 편이며 체구가 듬직하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '뼈대가 가늘고 여린 인상이다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '체격이 다부지고 뼈대도 단단하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '목덜미는 튼튼하나 허리부분이 약하다'))))
    ..add(SurveyCard(
      2,
      '나의 체격은?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '다소 살집이 있는 편으로 특히 배가 나온 원통형의 모습이다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '어깨와 가슴이 좁고 하체가 굵은 편이다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '어깨와 가슴은 발달했으나 엉덩이가 작고 다리가 가늘다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '가슴이 크고 허리와 엉덩이가 작아 전체적으로 역삼각형이다'))))
    ..add(SurveyCard(
      3,
      '나의 생김새는?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '이목구비가 뚜렷하고 광대뼈가 두꺼운 편이다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '얼굴형이 계란형으로 이목구비가 오밀조밀하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '얼굴이 다소 길고 입이 자그마하며 턱이 뾰족하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '이마가 위로 뻗어있고 넓으며 눈빛이 강한 편이다'))))
    ..add(SurveyCard(
      4,
      '나의 체질적인 특징은?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '남들보다 땀구멍이 크고 땀이 많으며 땀을 흘리면 개운하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '땀을 내면 기운이 떨어진다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '몸이 따뜻하고 손발에는 거의 땀이 없다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '머리가 크고 다리에 힘이 없는 편이다'))))
    ..add(SurveyCard(
      5,
      '평소 걸음걸이는?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '천천히 무게 있게 걷는다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '자연스럽고 얌전하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '가볍고 빠르며 몸을 좌우로 흔드는 편이다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '꼿꼿하고 어색하다'))))
    ..add(SurveyCard(
      6,
      '업무상 회의가 있을 때 나는?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '보수적이어서 변화를 싫어하지만 결단을 내려야 할 때는 과감히 내린다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '의견이 있어도 내세우지는 않지만 질문에는 논리 정연하게 생각을 말한다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '매사에 활동적이고 열성적이며 일을 미루는 사람들을 보면 답답하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '주장을 강하게 밀어붙이는 편이며 사소한 일이나 소수의 의견은 무시한다'))))
    ..add(SurveyCard(
      7,
      '평소 일하는 방식은?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '점잖게 처신하는 편으로 불필요하게 일을 벌이지 않는다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '꼼꼼하게 계획을 세워서 하는 편이나 여러 사람 앞에서는 욕심을 드러내지 않는다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '장기전에는 약하지만 단기간에 계획된 일은 잘한다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '주관이 매우 뚜렷하고 일 처리에 있어서 독선적인 경향이 짙다'))))
    ..add(SurveyCard(
      8,
      '일이 잘 안 풀릴 때 나는?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '스트레스를 향락이나 도박으로 풀기 시작하면 탐닉하게 된다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '남을 시기하길 잘하고 신세한탄을 하는 편이다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '슬퍼하고 한탄하게 되며 염세주의에 빠진다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '노기가 충천해 엉뚱한 사람에게 화풀이를 잘한다'))))
    ..add(SurveyCard(
      9,
      '나의 장점은?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '예의 바르고 매사에 신중해 주의사람들이 믿음직스러워 한다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '부드럽고 침착한 성격으로 생각을 많이 하는 편이라 빈틈이 없다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '판단력이 빠르고 임기응변에 능하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '친하든 안 친하든 불문하고 남하고 잘 사귀는 편이다'))))
    ..add(SurveyCard(
      10,
      '나의 단점은?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '점잖은 듯 하나 의심이 많고 게으른 편이다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '질투심이나 시기심이 많고 소심해서 남의 밑에 민간하게 반응한다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '급한 성격에 일을 쉽게 결정하고 후회할 때가 많다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '내 잘못을 잘 인정하지 않고 남에게 돌린다'))));

    return cardList;
  }
}