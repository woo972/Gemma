import 'package:gemma/customWidget/SurveyCard.dart';
import 'package:gemma/customWidget/SurveyRadioButton.dart';
import 'package:gemma/model/SurveyRadioButtonModel.dart';

class DiagnosticQuestions{
  static List<SurveyCard> getDiagnosticQuestions(){
    List<SurveyCard> cardList = List();  
    cardList.add(SurveyCard(
      1,
      '나의 골격은?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '허리가 굵은 편이며 체구가 듬직하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '뼈대가 가늘고 여린 인상이다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '체격이 다부지고 뼈대도 단단하다')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '목덜미는 튼튼하나 허리부분이 약하다'))));
    cardList.add(SurveyCard(
      2,
      '나의 체격은?',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '1st button')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '2nd button')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '3rd button')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '4th button'))));
    cardList.add(SurveyCard(
      3,
      'q3',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '1st button')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '2nd button')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '3rd button')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '4th button'))));
    cardList.add(SurveyCard(
      4,
      'q4',
      SurveyRadioButton(SurveyRadioButtonModel(false, 1, '1st button')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 2, '2nd button')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 3, '3rd button')),
      SurveyRadioButton(SurveyRadioButtonModel(false, 4, '4th button'))));

    return cardList;
  }
}