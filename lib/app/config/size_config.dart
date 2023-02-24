/*
기기마다 다른 사이즈를 가지고 있기 때문에 동적 사이징을 위해서 SizeConfig를 사용하여 MediaQuery를
 */
import 'package:flutter/material.dart';

class SizeConfig {
  /* 싱글톤 패턴으로 구현하기 위해 생성자를 private으로 설정 및 내부 필드를 static으로 선언하여
  새로운 instance가 생성되는 것을 방지한다. / 인스턴스가 이미 생성되어있는지 체크하여 생성이 되어있다면
  해당 인스턴스를 반환 해 줄 수 있는 로직도 있다.
   */
  factory SizeConfig() => _instance;
  SizeConfig._();

  static final SizeConfig _instance = SizeConfig._();
  /*
  late를 통해 null 값을 방지 하되 바로 초기화를 시켜주지 않는 변수를 선언한다.
  why? -> 기기마다 사이즈 값이 다르기 때문에 바로 초기화 시켜 주지 못한다.
   */
  late MediaQueryData _mediaQueryData;
  late double noneHomeIndicatorBottomInset;
  late double screenWidth;
  late double screenHeight;
  late double safeAreaWidth;
  late double safeAreaHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;
  late double _safeAreaHorizontal;
  late double _safeAreaVertical;
  late double safeBlockHorizontal;
  late double safeBlockVertical;
  double? profileDrawerWidth;
  late double refHeight;
  late double refWidth;
  late double statusBarHeight;
  late double bottomInsets;

  /*
  private 변수 _mediaQueryData는 MediaQuery를 호출하여 외부의 접근을 막고 private가 아닌 변수만 pick 할 수 있게 한다.
  MediaQuery는 Context를 통해 기기마다의 현재 사이즈를 반환해준다.
   */

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    refHeight = 1450;
    refWidth = 670;
    statusBarHeight = _mediaQueryData.padding.top;
    bottomInsets = _mediaQueryData.padding.bottom;
    noneHomeIndicatorBottomInset = _mediaQueryData.padding.bottom == 0 ? 16 : 0;

    /*
    화면 크기별 각 safeArea 정의 - 기준은 높이 1200픽셀
     */
    if (screenHeight < 1200) {
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

      safeAreaHeight = screenHeight - _safeAreaVertical;
      safeAreaWidth = screenWidth - _safeAreaHorizontal;
    } else {
      blockSizeHorizontal = screenWidth / 120;
      blockSizeVertical = screenHeight / 120;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 120;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 120;

      safeAreaHeight = screenHeight - _safeAreaVertical;
      safeAreaWidth = screenWidth - _safeAreaHorizontal;
    }
  }

  double getWidthRatio(double value) {
    double res = (value / refWidth) * 100;
    double temp = res * blockSizeHorizontal;

    return temp;
  }

  double getHeightRatio(double value) {
    double res = (value / refHeight) * 100;
    double temp = res * blockSizeVertical;
    return temp;
  }

  double getFontRatio(double value) {
    double res = (value / refHeight) * 100;
    double temp = 0.0;

    /*
    화면을 가로로 했을 때의 대응? / 아니면 갤럭시 폴드 같이 width가 넓은 화면을 고려해서 분기를 나눈 것 같다.
     */
    if (screenWidth < screenHeight) {
      temp = res * safeBlockHorizontal;
    } else {
      temp = res * safeBlockVertical;
    }
    return temp;
  }
}

/*
int형과 double형에 함께 대응 하기 위해 추상 클래스인 num을 extension한다.
 */
extension SizeUtils on num {
  double get toWidth => SizeConfig().getWidthRatio(toDouble());

  double get toHeight => SizeConfig().getHeightRatio(toDouble());

  double get toFont => SizeConfig().getFontRatio(toDouble());
}
